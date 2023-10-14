import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolmate/constants.dart';

class ExitDialog {
  void showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        content: Container(
            height: 160.0,
            width: kwidth! * 0.6,
            decoration: BoxDecoration(
                //color: k2GreyColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: k3GreyColor, width: 2)),
            child: Column(
              children: [
                Container(
                  height: 15.0,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0))),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Lottie.asset("assets/exit2.json",
                          repeat: false, width: 50.0, height: 50.0),
                      Expanded(
                        child: Container(
                          //color: Colors.red,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("EXIT APP"),
                              Text(
                                "DO YOU REALLY WANT TO EXIT APP?",
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 14.0, color: k4GreyColor),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: k2GreyColor,
                  height: 2.0,
                ),
                Container(
                  //color: Colors.amber,
                  height: 50.0,
                  padding: const EdgeInsets.only(right: 10.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).pop();
                        // setState(() {
                        //   print(exitApp);
                        //   exitApp = true;
                        //   print(exitApp);
                        // });
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      child: Container(
                        height: 35.0,
                        width: 60.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: k3GreyColor, width: 1.5)),
                        child: Center(
                            child: Text("YES",
                                style: TextStyle(color: k4GreyColor))),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        return;
                      },
                      child: Container(
                        height: 35.0,
                        width: 60.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: k4GreyColor,
                          borderRadius: BorderRadius.circular(5.0),
                          // border:
                          //     Border.all(color: k3GreyColor, width: 1.5),
                        ),
                        child: Center(
                            child: Text("NO",
                                style: TextStyle(
                                  color: kWhite,
                                ))),
                      ),
                    )
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}
