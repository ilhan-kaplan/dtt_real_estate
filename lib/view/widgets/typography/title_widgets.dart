import 'package:flutter/material.dart';

class TitleWidgets {
  Widget title01({
    required String title,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold,
    Color fontColor = const Color(0xCC000000),
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
      maxLines: 1,
    );
  }

  Widget title02({
    required String title,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
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

  Widget title03({
    required String title,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
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
}
