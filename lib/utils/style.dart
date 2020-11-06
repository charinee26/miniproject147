import 'package:flutter/material.dart';

class MyStyle {
  static Color primaryColor = Color.fromRGBO(20, 50, 129, 1);
  static Color secondaryColor = Colors.white;
  static Color errColor = Color.fromRGBO(255, 111, 97, 1);

  static Widget showLogo() {
    return Container(
      width: 350,
      child: Image.asset('img/logo.png'),
    );
  }

  static Widget showmountain() {
    //ภูเขา
    return Container(
      width: 200,
      child: Image.asset('img/mountain.jpg'),
    );
  }

  static Widget showwaterfall() {
    //นน้ำตก
    return Container(
      width: 200,
      child: Image.asset('img/waterfall.jpg'),
    );
  }

  static Widget showcafe() {
    //คาเฟ่
    return Container(
      width: 200,
      child: Image.asset('img/cafe.jpg'),
    );
  }

  static Widget showsea() {
    //ทะเล
    return Container(
      width: 200,
      child: Image.asset('img/sea.jpg'),
    );
  }
}
