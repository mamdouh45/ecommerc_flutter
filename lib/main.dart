import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp/pages/login.dart';

// start
void main() {
  // 1- run app
  runApp(MaterialApp(
      // class do not show ModeBanner
      debugShowCheckedModeBanner: false,
      // create in home Homepage  class extends statefulWidget
      home: Login()));
}
