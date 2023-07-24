import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

class SchoolSilverAppBar extends StatelessWidget {
  const SchoolSilverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return Container(
      color: kAmberColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: height * 0.14,
        ),
        Expanded(
          child: Text(
            'FightClub CBSE and MATRIC SCHOOL',
            textScaleFactor: 1.0,
            style: kBodyBoldTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            'No 12A,Nilgris Apartment',
            textScaleFactor: 1.0,
            style: kBodyLightTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            'Sardar Patel Road',
            textScaleFactor: 1.0,
            style: kBodyLightTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            'Guindy',
            textScaleFactor: 1.0,
            style: kBodyLightTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            'Chennai - 600025',
            textScaleFactor: 1.0,
            style: kBodyLightTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            'Tamil Nadu',
            textScaleFactor: 1.0,
            style: kBodyLightTextStyle,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: Colors.amber,
              thickness: 2.0,
            ),
          ),
        ),
        Expanded(
          child: Text(
            '+91 9485854848',
            textScaleFactor: 1.0,
            style: kBodyBoldTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            'velammalcbseguindy@gmail.com',
            textScaleFactor: 1.0,
            style: kBodyBoldTextStyle,
          ),
        ),
      ]),
    );
  }
}
