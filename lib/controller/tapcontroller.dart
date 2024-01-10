import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:soilmoisturedetector/constant/constant.dart';
import 'package:soilmoisturedetector/model/soilmodel.dart';
import 'package:soilmoisturedetector/widget/localnotification.dart';

class GetxTapController extends GetxController {
  Getallsoildetails? alldata;
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

  bool get iswatermanualconfirm => _ismanualwaterconfirm;
  List get allfeed => _allfeed;
  Feed? get latestfeeddata => _latestfeeddata;
  bool get pumpStatusmanually => _pumpStatusmanually;
  bool get pumpStatus => _pumpStatus;
  int get min => _min;
  int get sec => _sec;
  String get soiltitle => _soiltitle;
  var data = <Feed>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();

    getalldata();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Rx<VisualType?> selectedVisualType = Rx<VisualType?>(null);

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

  Future getalldata() async {
    _latestfeeddata = null;
    update();
    try {
      isDataLoading(true);
      final queryParameters = {
        "api_key": "330F3444455D4923",
        "interval": "0.5",
      };
      final response = await http.get(
        Uri.http('10.10.1.139:88', '/api/channel-data/698633/feeds',
            queryParameters),
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        var users = getallsoildetailsFromJson(response.body);
        alldata = users;
        _latestfeeddata = alldata!.feeds.last;

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
    scheduleTask();
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
        // Future.delayed(const Duration(seconds: 20))
        //     .whenComplete(() => getalldata());
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
