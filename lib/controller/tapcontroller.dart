import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:soilmoisturedetector/constant/constant.dart';
import 'package:soilmoisturedetector/model/soilmodel.dart';
import 'package:soilmoisturedetector/services/alarmmanager.dart';
import 'package:soilmoisturedetector/widget/localnotification.dart';
import 'package:workmanager/workmanager.dart';

class GetxTapController extends GetxController {
  //setter
  Getallsoildetails? latestdata;
  Getallsoildetails? alldata;
  List<Map<String, dynamic>> _allsoildatamap = [];
  final List _allfeed = [];
  Feed? _latestfeeddata;
  // 5 minutes in seconds
  Timer? _timer;
  int pumptimer = 0;
  int _min = 0;
  int _sec = 0;

  bool _ismanualwaterconfirm = false;
  var isDataLoading = false.obs;
  bool _pumpStatusmanually = false;
  bool _pumpStatus = false;
  String _soiltitle = '';
  Timer? _scheduletimer;
  final List<DateTime> _alldatetime = [];

  //getter
  List<Map<String, dynamic>> get allsoildatamap => _allsoildatamap;
  Timer get scheduletimer => _scheduletimer!;
  bool get iswatermanualconfirm => _ismanualwaterconfirm;
  List get allfeed => _allfeed;
  Feed? get latestfeeddata => _latestfeeddata;
  bool get pumpStatusmanually => _pumpStatusmanually;
  bool get pumpStatus => _pumpStatus;
  int get min => _min;
  int get sec => _sec;
  String get soiltitle => _soiltitle;
  List get alldatetime => _alldatetime;
  var data = <Feed>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    _startTimer();
    getlatestfeeddata();
    getalldata();
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

  void _startTimer() {
    // Create a periodic timer that executes the function every 5 seconds
    _scheduletimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      getlatestfeeddata();

      log('Executing your function periodically...');
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

  void setpump({required bool pumpstatus}) {
    _pumpStatus = pumpstatus;
    if (pumpStatus == false) {
      if (_timer != null) {
        _timer!.cancel();
        _ismanualwaterconfirm = false;
        _pumpStatus = false;
        _min = 0;
        _sec = 0;
        selectedVisualType.value = null;
        update();
      }
    }
    update();
  }

  Future getlatestfeeddata() async {
    try {
      isDataLoading(true);
      final queryParameters = {
        "api_key": "330F3444455D4923",
      };
      final response = await http.get(
        Uri.http('10.10.1.139:88', '/api/channel-data/698633/latest-feeds',
            queryParameters),
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        var users = getallsoildetailsFromJson(response.body);
        latestdata = users;
        _latestfeeddata = latestdata!.feeds.last;

        update();

        print('Successfully get Data');
      } else {
        print('Failedrerer to Getdata.');
      }
      return null;
    } catch (e) {
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
      var soildata = jsonEncode(response.body);
      var dec = jsonDecode(soildata);
      _allsoildatamap = dec['feeds'];

      log('List :${_allsoildatamap.toString()}');

      if (response.statusCode == 200) {
        var users = getallsoildetailsFromJson(response.body);
        alldata = users;
        for (var element in alldata!.feeds) {
          if (_alldatetime.contains(element.created)) {
            log('Already Exist');
          } else {
            _alldatetime.add(element.created);
          }
        }

        update();

        print('Successfully get Data');
      } else {
        print('Failedrerer to Getdata.');
      }
      return null;
    } catch (e) {
      print(e.toString());
    } finally {}
  }

  Future setwaterpump({
    required String status,
    required String field2,
    required String field3,
    required String field4,
    required String field5,
    required String field6,
    required String field7,
  }) async {
    try {
      final queryParameters = {
        "api_key": "8D35B69579284707",
        "status": status,
        "field2": field2,
        "field3": field3,
        "field4": field4,
        "field5": field5,
        "field6": field6,
        "field7": field7,
      };
      final response = await http.post(
        Uri.http('10.10.1.139:88', '/api/channel-data/update', queryParameters),
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        log('Successfully switch water pump');
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
    setwaterpump(
        status: '1',
        field2: _latestfeeddata!.field2,
        field3: _latestfeeddata!.field3,
        field4: _latestfeeddata!.field4,
        field5: _latestfeeddata!.field5,
        field6: _latestfeeddata!.field6,
        field7: _latestfeeddata!.field7);
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
        setwaterpump(
            status: '0',
            field2: _latestfeeddata!.field2,
            field3: _latestfeeddata!.field3,
            field4: _latestfeeddata!.field4,
            field5: _latestfeeddata!.field5,
            field6: _latestfeeddata!.field6,
            field7: _latestfeeddata!.field7);
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
