import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

class AllCycleTests extends StatefulWidget {
  const AllCycleTests({super.key});

  @override
  State<AllCycleTests> createState() => _AllCycleTestsState();
}

class _AllCycleTestsState extends State<AllCycleTests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Card(
                  color: Color.fromARGB(255, 241, 241, 241),
                  elevation: 0.0,
                  //MAIN CONTAINER
                  child: Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kLightGrey, width: 1.0),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        //TOP CONTAINER
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1.0),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.0),
                                  topLeft: Radius.circular(15.0))),
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Text(
                                'Cycle Test1 - Calculus',
                                style: kBodyBoldTextStyle,
                                textScaleFactor: 1.0,
                              ),
                              Spacer(),
                              Text(
                                '03-July-2023',
                                style: kBodyLightTextStyle,
                                textScaleFactor: 1.0,
                              )
                            ],
                          ),
                        )),
                        Row(
                          children: [
                            //BOTTOM LEFT CONTAINER
                            Expanded(
                              child: Container(
                                height: 80.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kLightGrey, width: 1.0),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15.0))),
                                padding: EdgeInsets.only(top: 5.0, left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MARKS',
                                      style: kBodyLightTextStyle,
                                      textScaleFactor: 1.0,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          '92/100',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: kSFUIText,
                                              color: Colors.black),
                                          textScaleFactor: 1.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            //BOTTOM RIGHT CONTAINER
                            Expanded(
                              child: Container(
                                height: 80.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kLightGrey, width: 1.0),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15.0))),
                                padding: EdgeInsets.only(top: 5.0, left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PERCENTAGE %',
                                      style: kBodyLightTextStyle,
                                      textScaleFactor: 1.0,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          '92%',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: kSFUIText,
                                              color: Colors.black),
                                          textScaleFactor: 1.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
