import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:schoolmate/student_authenticaton/student_login/result_screen.dart';
import 'package:schoolmate/student_authenticaton/student_login/student_id.dart';
import '../../constants.dart';

class QRScan extends StatefulWidget {
  const QRScan({super.key});

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
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
                          height: (height < 650) ? height * 0.05 : height * 0.1,
                        ),
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
                              Container(
                                height: width * 0.62 + 30.0,
                                width: width * 0.62 + 30.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kAmberColor, width: 2.0),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                              Container(
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
                                        Container(
                                            height: width * 0.625,
                                            width: width * 0.625,
                                            child: QrImage(
                                              data: scannedCode,
                                              backgroundColor: Colors.white,
                                            )),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ResultScreen(
                                                            scannedCode:
                                                                scannedCode,
                                                            studentID: 'none',
                                                          )));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 20.0,
                                                    horizontal: 40.0),
                                                backgroundColor: kAmberColor,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0))),
                                            child: Text(
                                              'FIND STUDENT',
                                              textScaleFactor: 1.0,
                                              style: kBodyBoldTextStyle,
                                            ))
                                      ],
                                    )
                                  : (isScanTapped)
                                      ? Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Container(
                                              height: width * 0.625,
                                              width: width * 0.625,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (qrViewController != null &&
                                                    isScanTapped) {
                                                  qrViewController!
                                                      .resumeCamera();
                                                  setState(() {
                                                    isScanTapped = false;
                                                  });
                                                }
                                              },
                                              child: Opacity(
                                                  opacity: 0.5,
                                                  child: Container(
                                                    height: width * 0.625,
                                                    width: width * 0.625,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                    style:
                                                        kBodyBoldTextStyleWhite,
                                                  )
                                                ]),
                                          ],
                                        )
                                      : Container()
                            ]),
                        SizedBox(
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
                                      builder: (context) => StudentID()));
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 40.0),
                                backgroundColor: kGrey850Color,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            child: Text(
                              'PROCEED WITH STUDENT ID NO',
                              textAlign: TextAlign.center,
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
