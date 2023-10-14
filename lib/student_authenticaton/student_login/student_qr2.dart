import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:schoolmate/services.dart';
import 'package:schoolmate/student_authenticaton/student_login/display_students.dart';
import 'package:schoolmate/student_authenticaton/student_login/student_phone.dart';
import 'package:schoolmate/widgets/background_widget.dart';
import '../../constants.dart';

class StudentQR2 extends StatefulWidget {
  const StudentQR2({super.key});

  @override
  State<StudentQR2> createState() => _StudentQR2State();
}

class _StudentQR2State extends State<StudentQR2> {
  final bool _isLoading = false;
  //QR Scanner
  final GlobalKey _globalKey = GlobalKey();
  String scannedCode = '';
  bool isScanTapped = true;
  QRViewController? qrViewController;
  Barcode? scannedBarCode;
  void onQRViewCreated(QRViewController qrViewController) {
    this.qrViewController = qrViewController;
    qrViewController.scannedDataStream.listen((event) {
      qrViewController.pauseCamera();
      setState(() {
        isScanTapped = true;
        scannedBarCode = event;
        scannedCode = scannedBarCode!.code.toString();
      });
    });
  }

  void showSnackbar(String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: k14BoldTextStyle,
      ),
      margin: EdgeInsets.only(bottom: kheight! * 0.75, left: 20.0, right: 20.0),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      backgroundColor: kPrimaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    //get the height and width of the device
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: BackgroundWidget(
          text: brandName,
          automaticallyImplyLeading: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: (height < 650) ? height * 0.05 : height * 0.1,
              // ),
              //TEXT TO SCAN QR
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 55.0, vertical: 20.0),
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
              Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                  height: width * 0.62 + 30.0,
                  width: width * 0.62 + 30.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor, width: 2.0),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                SizedBox(
                  height: width * 0.62,
                  width: width * 0.62,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: QRView(
                      key: _globalKey,
                      onQRViewCreated: onQRViewCreated,
                    ),
                  ),
                ),
                (scannedBarCode != null)
                    ? Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SizedBox(
                              height: width * 0.625,
                              width: width * 0.625,
                              child: QrImage(
                                data: scannedCode,
                                backgroundColor: Colors.white,
                              )),
                          (_isLoading)
                              ? Center(
                                  child: SizedBox(
                                    height: 40.0,
                                    width: 40.0,
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                      strokeWidth: 6.0,
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    // setState(() {
                                    //   _isLoading = true;
                                    // });
                                    // final responseBody = await ApiServices()
                                    //     .post('personal', {
                                    //   "student_id": scannedCode.toString()
                                    // }).catchError((error) {
                                    //   print(error);
                                    // });
                                    // setState(() {
                                    //   _isLoading = false;
                                    // });
                                    // if (responseBody == 'null') {
                                    //   showSnackbar(
                                    //       'INVALID STUDENT ID !!. SCAN AGAIN');
                                    //   setState(() {
                                    //     scannedBarCode = null;
                                    //   });
                                    //   return;
                                    // }
                                    // final List<Map<String, dynamic>>
                                    //     studentData =
                                    //     json.decode(responseBody);
                                    final List<Map<String, dynamic>>
                                        studentData;
                                    if (scannedCode.toString() ==
                                        ApiServices().studentData[0]
                                            ['phone_no_1']) {
                                      studentData = ApiServices().studentData;
                                    } else {
                                      showSnackbar(
                                          'INVALID STUDENT ID !!. SCAN AGAIN');
                                      setState(() {
                                        scannedBarCode = null;
                                      });
                                      return;
                                    }
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DisplayStudents(
                                                  studentData: studentData,
                                                )));
                                  },
                                  style: kSecondaryButton,
                                  child: Text(
                                    'FIND STUDENT',
                                    textScaleFactor: 1.0,
                                    style: kBodyBoldTextStyle,
                                  ))
                        ],
                      )
                    : (isScanTapped)
                        ? GestureDetector(
                            onTap: () {
                              if (qrViewController != null && isScanTapped) {
                                qrViewController!.resumeCamera();
                                setState(() {
                                  isScanTapped = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  height: width * 0.625,
                                  width: width * 0.625,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      height: width * 0.625,
                                      width: width * 0.625,
                                      color: Colors.white,
                                    )),
                                const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.qr_code_scanner_sharp,
                                        size: 50.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'TAP TO SCAN',
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            //fontWeight: FontWeight.bold,

                                            color: Colors.white),
                                      )
                                    ]),
                              ],
                            ),
                          )
                        : Container()
              ]),
              const SizedBox(
                height: 10.0,
              ),
              //QR SCAN STATUS
              (scannedBarCode != null)
                  ? Text(
                      'QR SCAN SUCCESSFUL!',
                      textScaleFactor: 1.0,
                      style: kBodyLightTextStyle,
                    )
                  : Container(),
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
              //TROUBLE IN SCANNING QR?
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 55.0, vertical: 20.0),
                  child: Text(
                    'TROUBLE IN SCANNING QR?',
                    textScaleFactor: 1.0,
                    style: kBodyLightTextStyle,
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentPhone()));
                  },
                  style: kGreyBigButton,
                  child: Text(
                    'PROCEED WITH STUDENT ID NO',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
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
        ));
  }
}
