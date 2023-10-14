import 'package:flutter/material.dart';
import 'package:schoolmate/student_authenticaton/student_login/student_qr2.dart';
import 'package:schoolmate/student_authenticaton/student_login/student_phone.dart';
import 'package:schoolmate/widgets/background_widget.dart';

import '../../constants.dart';

class StudentQR1 extends StatefulWidget {
  const StudentQR1({super.key});

  @override
  State<StudentQR1> createState() => _StudentQR1State();
}

class _StudentQR1State extends State<StudentQR1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BackgroundWidget(
        text: brandName,
        automaticallyImplyLeading: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: kheight! * 0.08,
            // ),
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
                    const TextSpan(text: ' IN THE ID CARD TO GET STARTED'),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const StudentQR2()),
                        );
                      },
                      style: kGreyButton,
                      child: Text(
                        'SCAN QR',
                        textScaleFactor: 1.0,
                        style: kBodyBoldTextStyleWhite,
                      )),
                )
              ],
            ),
            SizedBox(
              height: (kheight! < 600) ? kheight! * 0.05 : kheight! * 0.1,
            ),
            //OR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: k3GreyColor,
                      thickness: 2.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      textScaleFactor: 1.0,
                      style: TextStyle(fontSize: 16.0, color: k3GreyColor),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: k3GreyColor,
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
                    MaterialPageRoute(builder: (context) => const StudentPhone()),
                  );
                },
                style: kGreyBigButton,
                child: Text(
                  'PROCEED WITH PHONE NO',
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: kBodyBoldTextStyleWhite,
                )),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }
}
