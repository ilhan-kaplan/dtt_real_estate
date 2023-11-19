import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget iconWidget({
  required String icon,
  double width = 16,
  Color color = const Color(0x66000000),
}) {
  return SvgPicture.asset(
    icon,
    fit: BoxFit.cover,
    width: width,
    color: color,
  );
}
