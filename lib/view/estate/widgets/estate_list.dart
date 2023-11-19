import 'package:dtt_real_estate/constants/colors.dart';
import 'package:dtt_real_estate/constants/endpoints.dart';
import 'package:dtt_real_estate/controller/method/price_seperate.dart';
import 'package:dtt_real_estate/model/estate/EstateModel.dart';
import 'package:dtt_real_estate/view/detail/detail_page.dart';
import 'package:dtt_real_estate/view/widgets/icon_widgets/icons_group.dart';
import 'package:dtt_real_estate/view/widgets/typography/text_widgets.dart';
import 'package:dtt_real_estate/view/widgets/typography/title_widgets.dart';
import 'package:flutter/material.dart';

Widget estateListMethod(List<EstateModel> estateList) {
  return Expanded(
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: estateList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                          estateDetail: estateList[index], index: index)));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              padding: const EdgeInsets.all(14),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(1, 1),
                  ),
                ],
                color: AppColors.whiteColor,
              ),
              child: SizedBox(
                height: 90,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '${BaseURL.imageUrl}${estateList[index].image}',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            width: 90,
                            height: 90,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.redColor,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleWidgets().title02(
                                          title:
                                              '\$${priceSeperate(estateList[index].price.toString())}'),
                                      TextWidgets().subtitleText(
                                          title:
                                              '${estateList[index].zip} ${estateList[index].city}')
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          iconsGroup(estateList[index], index, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
