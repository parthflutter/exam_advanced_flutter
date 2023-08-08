import 'package:exam_advanced_flutter/view/homescreen.dart';
import 'package:exam_advanced_flutter/view/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page:() => HomeScreen()),
        GetPage(name: '/second', page:() => secondscreen()),
      ],
    ),
  );
}

