import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilis/styles/clipPath.dart';
import '../utilis/styles/customColors.dart';
import 'package:get/get.dart';

class HeaderDesign extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onIconPressed;
  final Function()? backIconPressed;
  final bool navigateBack;

  const HeaderDesign({
    super.key,
    required this.title,
    required this.icon,
    required this.onIconPressed,
    required this.backIconPressed,
    this.navigateBack = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                color: CustomColors.primaryColor,
                height: 130,
              ),
            ),
          ),
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              color: CustomColors.secondaryColor,
              height: 120,
            ),
          ),

          // Back button (left side)
          Visibility(
            visible: navigateBack,
            child: Positioned(
              top: 32,
              left: 8,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: backIconPressed,
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: -40,
            right: MediaQuery.of(context).size.width * 0.25, // To center the title
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Icon button (right side)
          Positioned(
            top: 20,
            right: 16,
            child: IconButton(
                icon: Icon(icon, color: Colors.white),
                onPressed: onIconPressed
            ),
          ),
        ],
      ),
    );
  }
}
