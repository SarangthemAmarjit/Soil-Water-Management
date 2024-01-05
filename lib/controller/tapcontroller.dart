import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:soilmoisturedetector/model/soilmodel.dart';

class GetxTapController extends GetxController {
  Getallsoildetails? alldata;
  final List _allfeed = [];
  Feed? _latestfeeddata;
  List get allfeed => _allfeed;
  Feed? get latestfeeddata => _latestfeeddata;

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
  Future getalldata() async {
    try {
      final queryParameters = {
        "api_key": "330F3444455D4923",
        "interval": "10",
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
    }
  }
}
