import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:schoolmate/student_authenticaton/student_id_profile/student_id_profile.dart';

import '../../constants.dart';

class ResultScreen extends StatelessWidget {
  final String scannedCode;
  final String studentID;
  ResultScreen({super.key, required this.scannedCode, required this.studentID});

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  child: (scannedCode != 'none')
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: width * 0.625,
                                width: width * 0.625,
                                child: QrImage(
                                  data: scannedCode.toString(),
                                  backgroundColor: Colors.white,
                                )),
                            Text(
                              scannedCode.toString(),
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: kSFUIText,
                                  color: Colors.black),
                            )
                          ],
                        )
                      : Container(
                          child: Text(
                            studentID.toString(),
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: kSFUIText,
                                color: Colors.black),
                          ),
                        ))),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => StudentIdProfile())));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * 0.9, 60.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  backgroundColor: kAmberColor,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                'PROCEED',
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: kBodyBoldTextStyle,
              )),
        ],
      ),
    );
  }
}
