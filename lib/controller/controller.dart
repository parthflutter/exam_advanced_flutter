import 'package:exam_advanced_flutter/ulitis/helper_class.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<dynamic> dataList = [];
  Future<List> apigita() async {
    dataList = await Apihelper.helper.getapidata();
    return dataList;
    }
}