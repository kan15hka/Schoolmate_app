import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schoolmate/student_authenticaton/otp_verif_page/otp_textformfield.dart';

import '../../../constants.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  //otp text editing controllers
  final _otpController1 = TextEditingController();
  final _otpController2 = TextEditingController();
  final _otpController3 = TextEditingController();
  final _otpController4 = TextEditingController();
  //Timer
  Duration duration = Duration();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //Timer minutes and seconds
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: kAmberColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SCHOOL TITLE
            Expanded(
                child: Container(
              color: kAmberColor,
              child: Center(
                child: Text(
                  "FIGHTCLUB SCHOOL",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: kOutfit,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.black),
                ),
              ),
            )),
            //OTP VERIFICATION DETAILS
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
                          height: 60.0,
                        ),
                        //ENTER OTP TO NUM
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'ENTER OTP SENT TO',
                            textScaleFactor: 1.0,
                            style: kBodyBoldTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            '+91 9564231256',
                            textScaleFactor: 1.0,
                            style: kBodyBoldTextStyle,
                          ),
                        ),
                        //OTP TEXTFORMFIELDS
                        SizedBox(height: 45.0),
                        Form(
                            child: Container(
                          height: 75.0,
                          width: width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OtpTextFormField(
                                otpController: _otpController1,
                              ),
                              OtpTextFormField(
                                otpController: _otpController2,
                              ),
                              OtpTextFormField(
                                otpController: _otpController3,
                              ),
                              OtpTextFormField(
                                otpController: _otpController4,
                              )
                            ],
                          ),
                        )),
                        SizedBox(height: 25.0),
                        //RESEND OTP AND TIMER
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'RESEND OTP',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: kSFUIText,
                                      color: Color.fromARGB(255, 99, 165, 219)),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                                width: 50.0,
                                child: Text(
                                  '($minutes:$seconds)',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontFamily: kSFUIText,
                                      color: kGrey850Color),
                                ),
                              )
                            ],
                          ),
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
