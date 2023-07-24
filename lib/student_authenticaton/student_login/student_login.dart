import 'package:flutter/material.dart';
import 'package:schoolmate/student_authenticaton/student_login/qr_scan.dart';
import 'package:schoolmate/student_authenticaton/student_login/student_id.dart';

import '../../constants.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kAmberColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //School Mate title
            Expanded(
                child: Container(
              color: kAmberColor,
              child: Center(
                child: Text(
                  "SCHOOL MATE",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: kOutfit,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.black),
                ),
              ),
            )),
            //Qr Scanner and Id credentials
            Expanded(
                flex: 7,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0))),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: (height < 600) ? height * 0.05 : height * 0.1,
                        ),
                        //TEXT TO SCAN QR
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 55.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'SCAN THE ',
                              style: kBodyLightTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'QR-CODE',
                                  style: kBodyBoldTextStyle,
                                ),
                                TextSpan(
                                    text: ' IN THE ID CARD TO GET STARTED'),
                              ],
                            ),
                          ),
                        ),
                        //QR CODE SCANNER
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                'assets/qr.png',
                                height: 250.0,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QRScan()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 30.0),
                                    backgroundColor: kGrey850Color,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                child: Text(
                                  'SCAN QR',
                                  textScaleFactor: 1.0,
                                  style: kBodyBoldTextStyleWhite,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: (height < 600) ? height * 0.05 : height * 0.1,
                        ),
                        //OR
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: kGrey500Color,
                                  thickness: 2.0,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'OR',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: kSFUIText,
                                      color: kGrey500Color),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: kGrey500Color,
                                  thickness: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //DONT HAVE QR CODE?
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 55.0, vertical: 20.0),
                            child: Text(
                              'DON\'T HAVE A QR CODE?',
                              textScaleFactor: 1.0,
                              style: kBodyLightTextStyle,
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentID()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(width * 0.9, 60.0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 40.0),
                                backgroundColor: kGrey850Color,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            child: Text(
                              'PROCEED WITH STUDENT ID NO',
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: kBodyBoldTextStyleWhite,
                            )),
                        SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom))
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
