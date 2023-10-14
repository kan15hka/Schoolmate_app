import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String brandName = 'SCHOOL MATE';
String schoolName = 'TYLER DURDEN SCHOOL';
//height and width
double? kheight;
double? kwidth;
//Color constants
Color kPrimaryColor = const Color.fromARGB(255, 28, 180, 194);
Color kSecondaryColor = const Color.fromARGB(255, 211, 245, 248);
Color kLSecondaryColor = const Color.fromARGB(255, 238, 253, 255);
Color k2PrimaryColor = const Color.fromARGB(255, 25, 173, 187);
Color k3PrimaryColor = const Color.fromARGB(255, 43, 156, 167);
Color k4PrimaryColor = const Color.fromARGB(255, 38, 93, 99);
Color k5GreyColor = const Color.fromARGB(255, 54, 54, 54);
Color k4GreyColor = const Color.fromARGB(255, 86, 84, 84);
Color k3GreyColor = const Color.fromARGB(255, 142, 142, 142);
Color k2GreyColor = const Color.fromARGB(255, 177, 177, 177);
Color k1GreyColor = const Color.fromARGB(255, 221, 221, 221);
Color kSemanticRed = const Color.fromARGB(255, 241, 75, 92);
Color kSemanticGreen = const Color.fromARGB(255, 21, 211, 106);
Color kWhite = Colors.white;
Color kBlack = Colors.black;
Color importantColor = Colors.red;
Color holidayColor = Colors.indigo;
Color occasionColor = Colors.amber;
List<Color> kListColors = [
  const Color.fromARGB(255, 231, 91, 91),
  const Color.fromARGB(255, 139, 188, 101),
  const Color.fromARGB(255, 255, 215, 72),
  const Color.fromARGB(255, 236, 149, 86),
  const Color.fromARGB(255, 101, 161, 251),
  const Color.fromARGB(255, 158, 130, 238),
  const Color.fromARGB(255, 178, 131, 161),
  const Color.fromARGB(255, 227, 154, 216),
  const Color.fromARGB(255, 249, 215, 197),
  const Color.fromARGB(255, 178, 131, 161),
  const Color.fromARGB(255, 227, 154, 216),
  const Color.fromARGB(255, 249, 215, 197)
];
//fonts
String kSFUIText = 'SFUIText';
String kFontFamily = GoogleFonts.outfit().fontFamily!;
//Text Style
var kBodyLightTextStyle = const TextStyle(fontSize: 16.0, color: Colors.black);

var kBodyBoldTextStyle =
    const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black);

var kBodyBoldTextStyleWhite =
    const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white);

var k14BoldTextStyle =
    const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black);
//Button Style
var kGreyButton = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    fixedSize: const Size.fromHeight(50.0),
    backgroundColor: k4GreyColor,
    elevation: 0.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
var kGreyBigButton = ElevatedButton.styleFrom(
    //padding: EdgeInsets.symmetric( horizontal: 20.0),
    maximumSize: Size.fromWidth(kwidth! * 0.9),
    fixedSize: const Size.fromHeight(50.0),
    backgroundColor: k4GreyColor,
    elevation: 0.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));

var kSecondaryButton = ElevatedButton.styleFrom(
    fixedSize: Size(kwidth! * 0.7, 45.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    backgroundColor: kSecondaryColor,
    elevation: 0.0,
    //side: BorderSide(style: BorderStyle.solid, color: k5GreyColor, width: 2.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ));
var kSecondaryOutlinedButton = ElevatedButton.styleFrom(
    fixedSize: Size(kwidth! * 0.7, 45.0),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    backgroundColor: kSecondaryColor,
    elevation: 0.0,
    side: BorderSide(style: BorderStyle.solid, color: k5GreyColor, width: 2.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ));

var kAmberBigButton = ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(50.0),
    maximumSize: Size.fromWidth(kwidth! * 0.9),
    //padding: EdgeInsets.symmetric(horizontal: 20.0),
    backgroundColor: kPrimaryColor,
    elevation: 0.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));

//Widgets

Widget addHorizontalSpace(double height) {
  return SizedBox(height: height);
}

Widget addVerticalSpace(double width) {
  return SizedBox(width: width);
}
