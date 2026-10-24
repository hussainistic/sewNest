import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.myOnPress,
    required this.buttonText,
    this.buttonClr = const Color(0xE0E0E0FF), // Default color
    this.buttonTextClr = Colors.purple, // Default text color
    required this.isButtonEnabled,
    required this.buttonHeight,
    required this.buttonWidth
  });

  final void Function()? myOnPress;
  final String buttonText;
  final Color buttonClr;
  final Color buttonTextClr;
  final bool isButtonEnabled;
  final double buttonHeight;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myOnPress,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: buttonClr,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.purple,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white,
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: buttonTextClr,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
