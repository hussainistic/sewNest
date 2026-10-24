import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/user_views/orders_screen/user_orders_screen.dart';
import '../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../utilis/styles/customColors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("Payment Successful", style: headingTextStyle(color: CustomColors.primaryColor),)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(UserOrdersView());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.secondaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal:80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('See Order',
                    style: subHeadingTextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
