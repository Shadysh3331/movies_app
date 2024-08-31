import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class MyThemeData
{
  static Color primaryColor=Color(0xff121312);
  static Color secondaryColor=Color(0xff282A28);
  static Color whiteColor=Color(0xffFFFFFF);
  static Color yellowColor=Color(0xffF7B539);



static ThemeData theme=ThemeData(
  scaffoldBackgroundColor: MyThemeData.primaryColor,
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
      iconTheme:IconThemeData(color: MyThemeData.whiteColor,size: 30),
    titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: MyThemeData.whiteColor
    ),
  ),
  textTheme:TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: MyThemeData.whiteColor
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: MyThemeData.whiteColor
    ),
    bodySmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xffB5B4B4)
    ),
    labelLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: MyThemeData.whiteColor
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: MyThemeData.secondaryColor,
    type:BottomNavigationBarType.fixed,
    selectedItemColor: MyThemeData.yellowColor,
    unselectedItemColor: Colors.white,

  )
);
}