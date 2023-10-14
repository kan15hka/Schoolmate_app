import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schoolmate/drawer/main_screen.dart';
import 'package:schoolmate/student_authenticaton/otp_verif_page/otp_textformfield.dart';
import 'package:schoolmate/widgets/background_widget.dart';

import '../../../constants.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationPage({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  //otp text editing controllers
  final _otpController1 = TextEditingController();
  final _otpController2 = TextEditingController();
  final _otpController3 = TextEditingController();
  final _otpController4 = TextEditingController();
  final _otpController5 = TextEditingController();
  final _otpController6 = TextEditingController();
  //Timer
  Duration duration = const Duration();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    _otpController4.dispose();
    _otpController5.dispose();
    _otpController6.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    const addSeconds = 1;
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
        backgroundColor: kPrimaryColor,
        body: BackgroundWidget(
          text: brandName,
          automaticallyImplyLeading: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
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
                  '+91 ${widget.phoneNumber}',
                  textScaleFactor: 1.0,
                  style: kBodyBoldTextStyle,
                ),
              ),
              //OTP TEXTFORMFIELDS
              const SizedBox(height: 45.0),
              Form(
                  child: SizedBox(
                height: 75.0,
                width: width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    ),
                    OtpTextFormField(
                      otpController: _otpController5,
                    ),
                    OtpTextFormField(
                      otpController: _otpController6,
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 25.0),
              //RESEND OTP AND TIMER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'RESEND OTP',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 99, 165, 219)),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 50.0,
                      child: Text(
                        '($minutes:$seconds)',
                        textScaleFactor: 1.0,
                        style: TextStyle(color: k3GreyColor),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MainScreen()));
                  },
                  style: kSecondaryButton,
                  child: Text(
                    'VERIFY',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    style: kBodyBoldTextStyle,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ));
  }
}
