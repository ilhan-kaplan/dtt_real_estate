import 'package:dtt_real_estate/constants/colors.dart';
import 'package:flutter/material.dart';

void showLoadingDialogBox(context) {
  showDialog<String>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      child: SizedBox(
        child: Stack(
          children: [
            Align(
              child: Container(
                //alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CircularProgressIndicator(
                  color: AppColors.redColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
