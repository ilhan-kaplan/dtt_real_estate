import 'package:dtt_real_estate/constants/icons.dart';
import 'package:dtt_real_estate/controller/store/appData.dart';
import 'package:dtt_real_estate/model/estate/EstateModel.dart';
import 'package:dtt_real_estate/view/estate/widgets/icons_numbers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget iconsGroup(EstateModel estateList, int index, context) {
  List<String> distances =
      Provider.of<AppData>(context, listen: false).housesSidtanceList!;
  String distance = distances[index];
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconsNums(icon: IconsApp.iconBed, num: estateList.bedrooms.toString()),
      iconsNums(icon: IconsApp.iconBath, num: estateList.bathrooms.toString()),
      iconsNums(icon: IconsApp.iconLayers, num: estateList.size.toString()),
      iconsNums(icon: IconsApp.iconLocation, num: '${distance}'),
    ],
  );
}

Widget iconsGroupSecond(EstateModel estateList, int index, context) {
  List<String> distances =
      Provider.of<AppData>(context, listen: false).housesSidtanceList!;
  String distance = distances[index];
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconsNums(icon: IconsApp.iconBed, num: estateList.bedrooms.toString()),
        iconsNums(
            icon: IconsApp.iconBath, num: estateList.bathrooms.toString()),
        iconsNums(icon: IconsApp.iconLayers, num: estateList.size.toString()),
        iconsNums(icon: IconsApp.iconLocation, num: '${distance}'),
      ],
    ),
  );
}
