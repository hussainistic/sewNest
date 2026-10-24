import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/auth_controller.dart';
import '../../../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../../../utilis/styles/customColors.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            container: true,
            excludeSemantics: true,
            child: Text(
              'Are you sure you want to logout?',
              textAlign: TextAlign.center,
              style: customTextStyle(
                color: CustomColors.secondaryColor,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: CustomColors.secondaryColor,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                ),
                child: Text(
                  'No',
                  style: customTextStyle(
                    color: CustomColors.secondaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
              // Yes Button: Filled
              ElevatedButton(
                onPressed: () {
                  Get.find<AuthController>().logout();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                ),
                child: Text(
                  'Yes',
                  style: customTextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
