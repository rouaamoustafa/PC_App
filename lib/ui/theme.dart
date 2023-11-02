import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Color(0xFFFFFF);
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = Color(0xFF424242);


class Themes{

  static final light = ThemeData(
    backgroundColor: Colors.white,
  // Edit By R primaryColor: primaryClr,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  );

  static final dark= ThemeData(
    backgroundColor: darkGreyClr,
  primaryColor: darkGreyClr,
  brightness: Brightness.dark
  );
}

TextStyle get subHeadingStyle{
  return  GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode? Colors.grey[400]:Colors.grey

      )
  );
}

TextStyle get HeadingStyle{
  return  GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode? Colors.white:Colors.black
      )
  );



}

TextStyle get titleStyle{
  return  GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode? Colors.white:Colors.black
      )
  );
}

TextStyle get subtitleStyle{
  return  GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode? Colors.grey[500]:Colors.grey[700],
      )
  );
}