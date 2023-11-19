// ignore_for_file: must_be_immutable, depend_on_referenced_packages, use_build_context_synchronously

import 'package:dtt_real_estate/constants/colors.dart';
import 'package:dtt_real_estate/constants/images.dart';
import 'package:dtt_real_estate/controller/method/internet_control.dart';
import 'package:dtt_real_estate/controller/service/google_map_request.dart';
import 'package:dtt_real_estate/controller/service/http_request.dart';
import 'package:dtt_real_estate/controller/store/appData.dart';
import 'package:dtt_real_estate/model/estate/EstateModel.dart';
import 'package:dtt_real_estate/view/estate/widgets/estate_list.dart';
import 'package:dtt_real_estate/view/widgets/show_dialog_popup/show_loading_box.dart';
import 'package:dtt_real_estate/view/widgets/typography/text_widgets.dart';
import 'package:dtt_real_estate/view/widgets/typography/title_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EstateListPage extends StatefulWidget {
  const EstateListPage({super.key});

  @override
  State<EstateListPage> createState() => _EstateListPageState();
}

class _EstateListPageState extends State<EstateListPage> {
  TextEditingController searchControl = TextEditingController();
  bool isEstateEmpty = false;
  bool isSearched = false;
  bool showEmptyImage = false;
  List<EstateModel>? estateList;
  List<EstateModel> searchEstateList = [];

  void bringEstateList() {
    internetCheck().then((value) {
      showLoadingDialogBox(context);
      if (value) {
        HTTPRequest.estateRequest(context).then((value) async {
          if (value) {
            estateList =
                Provider.of<AppData>(context, listen: false).estateList;
            List<String> houseDistance = [];
            for (int t = 0; t < estateList!.length; t++) {
              List<double> startPosition = [
                double.parse(estateList![t].latitude.toString()),
                double.parse(estateList![t].longitude.toString())
              ];
              List<double> endPosition = [
                Provider.of<AppData>(context, listen: false)
                    .userLatLong!
                    .latitude,
                Provider.of<AppData>(context, listen: false)
                    .userLatLong!
                    .longitude
              ];
              var deger = await GoogleMapsAPI.getDistanceDetails(
                  startPosition, endPosition);
              houseDistance.add(deger);
            }
            Provider.of<AppData>(context, listen: false)
                .getHousesDistance(houseDistance);
            isEstateEmpty = false;
          } else {
            isEstateEmpty = true;
          }
          Navigator.pop(context);
          setState(() {});
        });
      } else {
        isEstateEmpty = true;
        Navigator.pop(context);
        setState(() {});
      }
    });
  }

  void searchMethod(String text) {
    text = text.toLowerCase();
    if (estateList!.isNotEmpty && text.isNotEmpty) {
      searchEstateList.clear();
      for (var j = 0; j < estateList!.length; j++) {
        String des = estateList![j].description.toLowerCase();
        String city = estateList![j].city.toLowerCase();
        String zip = estateList![j].zip.toLowerCase();
        if (des.contains(text) || city.contains(text) || zip.contains(text)) {
          searchEstateList.add(estateList![j]);
        }
      }
      if (searchEstateList.isNotEmpty) {
        isSearched = true;
        showEmptyImage = false;
        setState(() {});
      }
      if (isSearched == true && searchEstateList.isEmpty) {
        showEmptyImage = true;
        setState(() {});
      }
    } else if (text.isEmpty) {
      searchEstateList.clear();
      isSearched = false;
      showEmptyImage = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    bringEstateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrayColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TitleWidgets().title01(title: 'DTT REAL ESTATE'),
                  const SizedBox(height: 20),
                  searchWidget(searchControl: searchControl),
                  const SizedBox(height: 20),
                  estateList != null && isEstateEmpty == false
                      ? estateListMethod(
                          isSearched ? searchEstateList : estateList!)
                      : isEstateEmpty
                          ? Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: TextWidgets().bodyText(
                                    title: 'We cannot show houses right now.'),
                              ),
                            )
                          : Container(),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              left: MediaQuery.of(context).size.height / 18,
              child: Visibility(
                visible: showEmptyImage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.searchEmptyImage,
                      width: MediaQuery.of(context).size.height / 3,
                    ),
                    const SizedBox(height: 40),
                    TitleWidgets().title03(
                      title: 'No results found!',
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.mediumColor,
                    ),
                    TitleWidgets().title03(
                      title: 'Perhaps try another search?',
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.mediumColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchWidget({required TextEditingController searchControl}) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: searchControl,
        onChanged: (value) {
          searchMethod(value);
        },
        style: TextStyle(
          fontSize: 14,
          color: AppColors.strongColor,
        ),
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: GestureDetector(
            onTap: () {
              if (isSearched) {
                isSearched = !isSearched;
                searchControl.text = '';
                showEmptyImage = false;
                setState(() {});
              }
            },
            child: Icon(
              isSearched != true ? Icons.search : Icons.close,
              size: 26,
              color: isSearched != true
                  ? AppColors.lightColor
                  : AppColors.strongColor,
            ),
          ),
          hintText: 'Search for a home',
          hintStyle: TextStyle(
            color: AppColors.lightColor,
          ),
          filled: true,
          fillColor: AppColors.darkGrayColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
