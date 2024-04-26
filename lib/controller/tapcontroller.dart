import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:soilmoisturedetector/constant/constant.dart';
import 'package:soilmoisturedetector/model/soilmodel.dart';
import 'package:soilmoisturedetector/services/localnotification.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetxTapController extends GetxController {

  //setter
  Getallsoildetails? latestdata;
  Getallsoildetails? alldata;
  List _allsoildatamap = [];
  List _allsoildatamaplast10 = [];
  final List _allfeed = [];
  Feed? _latestfeeddata;
  // 5 minutes in seconds
  Timer? _timer;
  int pumptimer = 0;
  int _min = 0;
  int _sec = 0;

  bool _ismanualwaterconfirm = false;
  bool _istabonnotification = true;
  var isDataLoading = false.obs;
  bool _pumpStatusmanually = false;
  bool _isserverok = true;
  bool _pumpStatus = false;
  String _soiltitle = '';


double _progressValue = 0.0;
double get progressvalue=>_progressValue;
  Timer? _circulartimer;
  String _elevation='';
   String get elevation => _elevation;
  Timer? _scheduletimer;
  final List<DateTime> _alldatetime = [];
  List<DateTime> _alldatetimelast10 = [];
  late ZoomPanBehavior zoomPanBehavior;

  //getter
  bool get istabonnotification => _istabonnotification;
  bool get isserverok => _isserverok;
  List get allsoildatamap => _allsoildatamap;
  List get allsoildatamaplast10 => _allsoildatamaplast10;
  Timer get scheduletimer => _scheduletimer!;
  bool get iswatermanualconfirm => _ismanualwaterconfirm;
  List get allfeed => _allfeed;
  Feed? get latestfeeddata => _latestfeeddata;
  bool get pumpStatusmanually => _pumpStatusmanually;
  bool get pumpStatus => _pumpStatus;
  int get min => _min;
  int get sec => _sec;
  String get soiltitle => _soiltitle;
  List<DateTime> get alldatetime => _alldatetime;
  List<DateTime> get alldatetimelast10 => _alldatetimelast10;
  var data = <Feed>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    Future.delayed(const Duration(seconds: 1))
        .whenComplete(() => FlutterNativeSplash.remove());
    if (_isserverok) {
      _startTimer();
      getlatestfeeddata();
      getalldata();
      getzoompan();
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Rx<VisualType?> selectedVisualType = Rx<VisualType?>(null);

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _scheduletimer!.cancel();
    super.dispose();
  }

  void setontapnotification() {
    _istabonnotification = true;

    update();
    log(_istabonnotification.toString());
  }

  void getzoompan() {
    zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
      zoomMode: ZoomMode.x,
      enableSelectionZooming: true,
    );
  }

  void monitorbackgroundservice(ServiceInstance service) {
    _istabonnotification = true;
    update();
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          if (latestfeeddata != null) {
            if (latestfeeddata!.field3.isEmpty) {
              log('empty value');
            } else {
              if (int.parse(latestfeeddata!.field3) < 50) {
                service.setForegroundNotificationInfo(
                    title: 'ALERT ⚠️ ⚠️ ', content: 'Low Soil Moisture Level');
                log('istab checking ${_istabonnotification.toString()} ');
                if (_istabonnotification) {
                  log('istab is  false');
                  NotificationService().showalarmwarning(
                      title: '⚠️Critical Soil Moisture Level⚠️ ',
                      body: 'Tap Here Soon to Pump the Water');

                  _istabonnotification = false;
                  update();
                } else {
                  log('istab is  true');
                }
              } else {
                _istabonnotification = true;
                update();
                NotificationService().calcelnotification();
                service.setForegroundNotificationInfo(
                    title: 'Agri Sense',
                    content:
                        'Current Soil Moisture Level : ${latestfeeddata == null ? '' : latestfeeddata!.field3}');
              }
            }
          } else {
            service.setForegroundNotificationInfo(
                title: 'Agri Sense', content: 'SERVER ERROR');
          }
        }
      }
    });
  }

  void _startTimer() {
    // Create a periodic timer that executes the function every 5 seconds
    _scheduletimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      getlatestfeeddata();
      getalldata();
    });
  }

  void getsoildetailaccordingtoindex({required int index}) {
    switch (index) {
      case 0:
        _soiltitle = 'Soil Humidity';
        update();
        break;
      case 1:
        _soiltitle = 'Soil Temperature';
        update();
        break;
      case 2:
        _soiltitle = 'Soil PH Level';
        update();
        break;
      default:
    }
  }

  void setradiobuttoncancellationhandle() {
    selectedVisualType.value = null;
  }

  void updateSelectedVisualType(
      {required VisualType value, required int timerforpump}) {
    selectedVisualType.value = value;
    pumptimer = timerforpump * 60;
    update();
  }

  void updateTimerValue({required int timerforpump}) {
    pumptimer = timerforpump * 60;
    update();
  }

  void setpumpmanually({
    required bool pumpstatus,
  }) {
    _pumpStatusmanually = pumpstatus;
    selectedVisualType.value = null;
    if (_timer != null) {
      _timer!.cancel();
      _ismanualwaterconfirm = false;
      _pumpStatus = false;
      _min = 0;
      _sec = 0;
      update();
    }
    update();
  }

  void startTimeforcircular() {
    const duration = Duration(seconds: 5);
    _circulartimer = Timer.periodic(duration, (Timer timer) {
    if(_elevation.isEmpty||_elevation=='0'){
     // Increment progress value every second until it reaches 5 seconds
        _progressValue += 0.2; 
        update();// Increment by 0.2 every second (100% / 5 seconds = 0.2)
        if (_progressValue >= 1.0) {
         _circulartimer?.cancel();
         _pumpStatus = false;
         update();
       EasyLoading.showError('Error Pump Activation Failed⚠️⚠️ Check Wire is connected Properly');
        }
    }else{
      _progressValue=1.0;
        _circulartimer?.cancel();
        update();
    }
   
    
    });
  }

  void setpump({required bool pumpstatus}) {
    _pumpStatus = pumpstatus;
    setwaterpump(isActive: true);
    if (_ismanualwaterconfirm == false) {
      startTimeforcircular;
      NotificationService().showNotification(
          title: 'Water Pump Activated 🚰',
          body: 'Your water pump 💦 has been switched on successfully');

    }
    if (pumpStatus == false) {
      if (_ismanualwaterconfirm) {
        if (_timer != null) {
          setwaterpump(isActive: false);
          _timer!.cancel();
          _ismanualwaterconfirm = false;
          _pumpStatus = false;
          _min = 0;
          _sec = 0;
          selectedVisualType.value = null;
          update();
        }
      } else {
        setwaterpump(isActive: false);
        NotificationService().showNotification(
            title: 'Water Pump Deactivated 🚰',
            body: 'Your water pump 💦 has been switched off successfully');
      }
    }
    update();
  }

  Future getlatestfeeddata() async {
  
    if (latestdata == null) {
      isDataLoading(true);
      
    }
    try {
      final queryParameters = {
        "api_key": "330F3444455D4923",
      };
      final response = await http.get(
        Uri.http('10.10.1.139:88', '/api/channel-data/698633/latest-feeds',
            queryParameters),
      );

      if (response.statusCode == 200) {
        _isserverok = true;
        update();
        var users = getallsoildetailsFromJson(response.body);

        if (latestdata == null) {
          latestdata = users;
          _latestfeeddata = latestdata!.feeds.last;

          update();
        } else {
          if (users == latestdata ||
              users.feeds.last.field3.isEmpty ||
              users.feeds.last.field2.isEmpty) {
            // if (users.feeds.last.field4.isNotEmpty) {
            //   await prefs.setString(
            //     'nitro',
            //     users.feeds.last.field4,
            //   );
            //   await prefs.setString(
            //     'phos',
            //     users.feeds.last.field5,
            //   );
            //   await prefs.setString(
            //     'potas',
            //     users.feeds.last.field6,
            //   );
            // }

            log('Data Already same');
          } else {
            isDataLoading(true);
            latestdata = users;
            _latestfeeddata = latestdata!.feeds.last;
            _elevation = latestdata!.channel.elevation;

            update();
          }
        }
      } else {
        print('Failedrerer to Getdata.');
        Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          _isserverok = false;
          update();
        });
      }
      return null;
    } catch (e) {
      Future.delayed(const Duration(seconds: 5)).whenComplete(() {
        _isserverok = false;
        update();
      });
      print(e.toString());
    } finally {
      isDataLoading(false);
    }
  }

  Future getalldata() async {
    try {
      final queryParameters = {
        "api_key": "330F3444455D4923",
        "interval": "60",
      };
      final response = await http.get(
        Uri.http('10.10.1.139:88', '/api/channel-data/698633/feeds',
            queryParameters),
      );
      // var soildata = jsonEncode(response.body);
      Map<String, dynamic> dec = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var users = getallsoildetailsFromJson(response.body);
        alldata = users;
        _allsoildatamap = dec['feeds'];

        if (_allsoildatamap.length > 10) {
          var last10 = _allsoildatamap.sublist(_allsoildatamap.length - 10);

          _allsoildatamaplast10 = last10.reversed.toList();
          update();
        } else {
          var last10 = _allsoildatamap.sublist(_allsoildatamap.length);

          _allsoildatamaplast10 = last10.reversed.toList();
          update();
        }

        for (var element in alldata!.feeds) {
          if (_alldatetime.contains(element.created)) {
          } else {
            _alldatetime.add(element.created);
          }
        }
        if (alldatetime.length > 10) {
          var last10datetime = _alldatetime.sublist(_alldatetime.length - 10);
          _alldatetimelast10 = last10datetime.reversed.toList();

          update();
        } else {
          var last10datetime = _alldatetime.sublist(_alldatetime.length);
          _alldatetimelast10 = last10datetime.reversed.toList();

          update();
        }
      } else {
        print('Failedrerer to GetAlldata.');
      }
      return null;
    } finally {}
  }

  Future setwaterpump({
    required bool isActive,
  }) async {
    try {
      final queryParameters = {
        "id": 698633,
        "isactive": isActive,
      };
      final response = await http.post(
        Uri.http('10.10.1.139:88', '/api/channel-data/change-active',
            queryParameters),
      );
      log('Set Water Pump Response ;${response.statusCode}');

      if (response.statusCode == 200) {
        log('Successfully switch water pump');
        getlatestfeeddata();
      } else {
        print('Failedrerer to Getdata.');
      }
      return null;
    } catch (e) {
      print(e.toString());
    }
  }

  void startTimer() {
    _pumpStatus = true;
    setwaterpump(isActive: true);
    NotificationService().showNotification(
        title: 'Water Pump Activated',
        body: 'Water Pump Activated for ${pumptimer ~/ 60} min');
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (pumptimer > 0) {
        pumptimer--;

        _min = (pumptimer / 60).floor();
        _sec = pumptimer % 60;
        update();
      } else {
        _timer!.cancel(); // Stop the timer when it reaches 0
        // Add your desired action when the countdown reaches 0 here

        _ismanualwaterconfirm = false;
        setwaterpump(isActive: false);
        _pumpStatus = false;
        _min = 0;
        _sec = 0;
        selectedVisualType.value = null;
        update();
        NotificationService().showNotification(
            title: 'Done', body: '🚰 Water Pump Completed  Successfully');
      }
    });
    _ismanualwaterconfirm = true;
    update();
  }

  void scheduleTask() {
    const Duration interval = Duration(seconds: 30);
    int repeatCount =
        pumptimer ~/ 30; // 5 minutes in seconds divided by 30 seconds interval

    int executionCount = 0;

    Timer.periodic(interval, (Timer timer) {
      if (executionCount < repeatCount) {
        getalldata();

        executionCount++;
      } else {
        timer.cancel();
      }
    });
  }

  //BACKGROUND SERVICES
}
