import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/subjects/subject_performance/subject_performnace.dart';

class SubjectsWidget extends StatefulWidget {
  const SubjectsWidget({super.key});

  @override
  State<SubjectsWidget> createState() => _SubjectsWidgetState();
}

class _SubjectsWidgetState extends State<SubjectsWidget> {
  List<Map> subjectCard = [
    {
      'subName': 'MATHEMATICS',
      'subColor': Colors.orange,
      'subCode': 'M',
      'subTeacher': 'Mr.Teacher Name 1'
    },
    {
      'subName': 'SOCIAL SCIENCE',
      'subColor': Colors.red,
      'subCode': 'SS',
      'subTeacher': 'Mr.Teacher Name 2'
    },
    {
      'subName': 'COMPUTER SCIENCE',
      'subColor': Colors.green,
      'subCode': 'CS',
      'subTeacher': 'Mr.Teacher Name 3'
    }
  ];
  @override
  Widget build(BuildContext context) {
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
            //WIDGETS
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
                      //returns the widget in navbar widget list
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.0,
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'All Subjects ',
                                  textScaleFactor: 1.0,
                                  style: kBodyBoldTextStyle,
                                ),
                                Text(
                                  '(3)',
                                  textScaleFactor: 1.0,
                                  style: kBodyBoldTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            height: height! * 0.65,
                            child: ListView.builder(
                                itemCount: subjectCard.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SubjectPerformanceWidget(
                                                    subName: subjectCard[index]
                                                        ['subName'],
                                                  )));
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Card(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          elevation: 0.0,
                                          child: Container(
                                            height: 90.0,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 230, 230, 230),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Container(
                                                      width: 75.0,
                                                      height: 75.0,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              subjectCard[index]
                                                                  ['subColor'],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0)),
                                                      child: Center(
                                                        child: Text(
                                                          subjectCard[index]
                                                              ['subCode'],
                                                          textScaleFactor: 1.0,
                                                          style: TextStyle(
                                                              fontSize: 30.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  kSFUIText,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 15.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        subjectCard[index]
                                                            ['subName'],
                                                        style:
                                                            kBodyBoldTextStyle,
                                                        textScaleFactor: 1.0,
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        subjectCard[index]
                                                            ['subTeacher'],
                                                        style:
                                                            kBodyLightTextStyle,
                                                        textScaleFactor: 1.0,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  );
                                }),
                          ),
                          //OTP TEXTFORMFIELDS
                          SizedBox(height: 45.0),

                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom))
                        ],
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
