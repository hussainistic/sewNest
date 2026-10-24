import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dimensions.dart';
import 'customColors.dart';

TextStyle headingTextStyle({required Color color}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: Dimensions.fontSizeHeading,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}


TextStyle subHeadingTextStyle ({required Color color}) {
  return GoogleFonts.zillaSlab(
      textStyle: TextStyle(
        height: 1.7,
          fontSize: Dimensions.fontSizeSubHeading,
          color: color,
          fontWeight: FontWeight.bold
      )
  );
}

TextStyle nameTextStyle ({required Color color}) {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: Dimensions.fontSizeSubHeading,
          fontWeight: FontWeight.bold,
          color: color
      )
  );
}

TextStyle customTextStyle ({required Color color, required double fontSize , }) {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: fontSize,
          fontStyle: FontStyle.italic,
          color: color,
          fontWeight: FontWeight.w600,
      )
  );
}


TextStyle get appBarTextStyle {
  return GoogleFonts.oswald(
      textStyle: const TextStyle(
          fontSize: Dimensions.fontSizeExtraLarge,
          fontWeight: FontWeight.bold,
          color: Colors.white,
      )
  );
}

TextStyle get labelTextStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
        color:  CustomColors.primaryColor,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
          // fontSize: Dimensions.fontSizeDefault
      ),
  );
}

var boxShadows = [
  const BoxShadow(
    color: CustomColors.darkShadowColor,
    offset: Offset(2.0, 2.0),
    blurRadius: 2.0,
    spreadRadius: 2.0
  ),
  const BoxShadow(
      color: CustomColors.lightShadowColor,
      offset: Offset(-2.0, -2.0),
      blurRadius: 2.0,
      spreadRadius: 2.0
  )
];