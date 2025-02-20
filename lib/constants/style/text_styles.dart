import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle12(BuildContext context,{Color? color, FontWeight? fontWeight}) {
  final height = MediaQuery.of(context).size.height;
  return GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontSize: height * 0.012,
      fontWeight: fontWeight ?? FontWeight.w500);
}

TextStyle textStyle14(BuildContext context,{Color? color, FontWeight? fontWeight}) {
  final height = MediaQuery.of(context).size.height;
  return GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontSize: height * 0.014,
      fontWeight: fontWeight ?? FontWeight.w500);
}

TextStyle textStyle16(BuildContext context,{Color? color, FontWeight? fontWeight, TextDecoration? decoration}) {
  final height = MediaQuery.of(context).size.height;
  return GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontSize: height * 0.016,
      decoration: decoration,
      fontWeight: fontWeight ?? FontWeight.w500);
}

TextStyle textStyle18(BuildContext context,{Color? color, FontWeight? fontWeight}) {
  final height = MediaQuery.of(context).size.height;
  return GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontSize: height * 0.018,
      fontWeight: fontWeight ?? FontWeight.w500);
}

TextStyle textStyle20(BuildContext context,{Color? color, FontWeight? fontWeight}) {
  final height = MediaQuery.of(context).size.height;
  return GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontSize: height * 0.020,
      fontWeight: fontWeight ?? FontWeight.w500);
}

TextStyle textStyle22(BuildContext context,{Color? color, FontWeight? fontWeight}) {
  final height = MediaQuery.of(context).size.height;
  return GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontSize: height * 0.022,
      fontWeight: fontWeight ?? FontWeight.w500);
}
