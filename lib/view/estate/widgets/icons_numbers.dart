import 'package:dtt_real_estate/constants/colors.dart';
import 'package:dtt_real_estate/view/widgets/typography/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget iconsNums({required String icon, required String num}) {
  return Row(
    children: [
      SvgPicture.asset(
        icon,
        fit: BoxFit.cover,
        width: 16,
        color: AppColors.mediumColor,
      ),
      const SizedBox(width: 4),
      TextWidgets().detailText(
          title: num, fontSize: 10, fontColor: AppColors.mediumColor)
    ],
  );
}
