import 'package:flutter/material.dart';
import '../utilis/styles/CustomAppTextStyle.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.headingTitle,
    required this.subHeadingTitle,
    required this.headingColor,
    required this.subHeadingColor,
  });

  final String headingTitle;
  final String subHeadingTitle;
  final Color headingColor;
  final Color subHeadingColor;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(headingTitle, style: headingTextStyle(color: headingColor),),
          Row(
            children: [
              SizedBox(width: 90,),
              Text(subHeadingTitle, style: subHeadingTextStyle(color: subHeadingColor),),
            ],
          ),]
    );
  }
}