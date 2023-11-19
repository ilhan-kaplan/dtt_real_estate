import 'package:dtt_real_estate/constants/colors.dart';
import 'package:dtt_real_estate/constants/images.dart';
import 'package:dtt_real_estate/controller/method/get_lat_long.dart';
import 'package:dtt_real_estate/view/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    userPositionLocator(context).then((value) {
      if (value) {
        Future.delayed(const Duration(seconds: 2)).then((val) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redColor,
      body: Center(
        child: Image.asset(
          Images.dttIcon,
          scale: 1.5,
        ),
      ),
    );
  }
}
