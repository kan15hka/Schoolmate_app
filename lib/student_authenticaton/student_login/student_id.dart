import 'package:flutter/material.dart';
import 'package:schoolmate/student_authenticaton/student_login/qr_scan.dart';
import 'package:schoolmate/student_authenticaton/student_login/result_screen.dart';

import '../../constants.dart';

class StudentID extends StatefulWidget {
  const StudentID({super.key});

  @override
  State<StudentID> createState() => _StudentIDState();
}

class _StudentIDState extends State<StudentID> {
  //student Id Text editing controller
  final TextEditingController _studentIDController = TextEditingController();
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
                      fontFamily: 'Outfit',
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
                        //PROCEED WITH STUDENT ID
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 55.0, vertical: 20.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'PROCEED WITH ',
                              style: kBodyLightTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'STUDENT ID',
                                  style: kBodyBoldTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),

                        //STUDENT ID TEXT FIELD
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10.0),
                          child: SizedBox(
                            height: 57.0,
                            width: width * 0.8,
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: kSFUIText,
                                  fontSize: 20.0),
                              controller: _studentIDController,
                              cursorColor: kAmberColor,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0)),
                                labelText: 'STUDENT ID NO',
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: kSFUIText,
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        //FIND STUDENT BUTTON
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultScreen(
                                            scannedCode: 'none',
                                            studentID:
                                                _studentIDController.text,
                                          )));
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(width * 0.7, 60.0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 40.0),
                                backgroundColor: kAmberColor,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            child: Text(
                              'FIND STUDENT',
                              textScaleFactor: 1.0,
                              style: kBodyBoldTextStyle,
                            )),
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
                        SizedBox(
                          height: height * 0.025,
                        ),
                        //HAVING A QR CODE?
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 55.0, vertical: 20.0),
                            child: Text(
                              'HAVING A QR CODE?',
                              textScaleFactor: 1.0,
                              style: kBodyLightTextStyle,
                            )),
                        ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRScan()));
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(width * 0.7, 60.0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 40.0),
                                backgroundColor: kGrey850Color,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            child: Text(
                              'SCAN THE QR CODE',
                              textScaleFactor: 1.0,
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
