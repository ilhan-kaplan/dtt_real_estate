import 'dart:io';

import 'package:dtt_real_estate/constants/colors.dart';
import 'package:dtt_real_estate/view/estate/estate_list_page.dart';
import 'package:dtt_real_estate/view/information/information_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  List<Widget> pages = [
    const EstateListPage(),
    const InformationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: pages[_selectedPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        height: Platform.isIOS ? 93 : 70,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: '',
            ),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: AppColors.strongColor,
          unselectedItemColor: AppColors.mediumColor,
          onTap: (int index) {
            switch (index) {
              case 0:
              // only scroll to top when current index is selected.

              case 1:
              //showModal(context);
            }
            setState(
              () {
                _selectedPage = index;
              },
            );
          },
        ),
      ),
    );
  }
}
