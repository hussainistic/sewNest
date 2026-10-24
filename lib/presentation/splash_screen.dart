import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../carousel_slider/carousel_slider.dart';
import '../utilis/styles/customColors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(CarouselSliderScreen());
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: CustomColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200, height: 200),

            const SizedBox(height: 20),

            const Text(
              'Sew Nest',
              style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

