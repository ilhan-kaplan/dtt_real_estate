// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:dtt_real_estate/constants/colors.dart';
import 'package:dtt_real_estate/constants/endpoints.dart';
import 'package:dtt_real_estate/constants/icons.dart';
import 'package:dtt_real_estate/constants/txt.dart';
import 'package:dtt_real_estate/controller/method/price_seperate.dart';
import 'package:dtt_real_estate/model/estate/EstateModel.dart';
import 'package:dtt_real_estate/view/widgets/icon_widgets/icon_svg.dart';
import 'package:dtt_real_estate/view/widgets/icon_widgets/icons_group.dart';
import 'package:dtt_real_estate/view/widgets/maps_widgets/current_location.dart';
import 'package:dtt_real_estate/view/widgets/typography/text_widgets.dart';
import 'package:dtt_real_estate/view/widgets/typography/title_widgets.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({required this.estateDetail, required this.index, super.key});
  EstateModel estateDetail;
  int index;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.network(
              '${BaseURL.imageUrl}${widget.estateDetail.image}',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: 60,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: iconWidget(
                  icon: IconsApp.iconBack,
                  width: 30,
                  color: AppColors.whiteColor),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleWidgets().title02(
                          title:
                              '\$${priceSeperate(widget.estateDetail.price.toString())}'),
                      const SizedBox(width: 60),
                      iconsGroupSecond(
                          widget.estateDetail, widget.index, context),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TitleWidgets().title02(title: 'Description'),
                  const SizedBox(height: 20),
                  TextWidgets().detailText(
                      title: aboutText.detail,
                      fontColor: AppColors.mediumColor),
                  const SizedBox(height: 20),
                  TitleWidgets().title02(title: 'Location'),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 240,
                    child: GoogleMapShow(
                      double.parse(widget.estateDetail.latitude.toString()),
                      double.parse(widget.estateDetail.longitude.toString()),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
