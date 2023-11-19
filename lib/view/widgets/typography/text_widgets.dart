import 'package:flutter/material.dart';

class TextWidgets {
  Widget bodyText({
    required String title,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    Color fontColor = const Color(0xCC000000),
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
      //textAlign: TextAlign.center,
    );
  }

  Widget inputText({
    required String title,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w300,
    Color fontColor = const Color(0xCC000000),
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget hintText({
    required String title,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    Color fontColor = const Color(0xCC000000),
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget subtitleText({
    required String title,
    double fontSize = 10,
    FontWeight fontWeight = FontWeight.w400,
    Color fontColor = const Color(0xCC000000),
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }

  Widget detailText({
    required String title,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    Color fontColor = const Color(0xCC000000),
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
    );
  }
}
