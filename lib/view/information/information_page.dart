// ignore_for_file: depend_on_referenced_packages

import 'package:dtt_real_estate/constants/images.dart';
import 'package:dtt_real_estate/constants/txt.dart';
import 'package:dtt_real_estate/view/widgets/typography/text_widgets.dart';
import 'package:dtt_real_estate/view/widgets/typography/title_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  _launchURL() async {
    Uri _url = Uri.parse('https://www.d-tt.nl/en/apps');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TitleWidgets().title01(title: 'ABOUT'),
              const SizedBox(height: 20),
              TextWidgets().bodyText(title: aboutText.about),
              const SizedBox(height: 20),
              TitleWidgets().title02(title: 'Design and Development'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.asset(
                    Images.dttBannerM,
                    scale: 1.4,
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      TextWidgets().bodyText(title: 'by DTT'),
                      const SizedBox(height: 2),
                      InkWell(
                        onTap: () => _launchURL(),
                        child: TextWidgets()
                            .bodyText(title: 'd-tt.nl', fontColor: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
      ),
    ));
  }
}
