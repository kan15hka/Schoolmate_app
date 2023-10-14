import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/pages/subjects/subject_performance/subject_performnace.dart';
import 'package:schoolmate/widgets/background_widget.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
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
        backgroundColor: kPrimaryColor,
        body: BackgroundWidget(
          text: "SUBJECTS",
          automaticallyImplyLeading: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'SUBJECTS ',
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
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                height: kheight! * 0.65,
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
                                        subName: subjectCard[index]['subName'],
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Card(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              elevation: 0.0,
                              child: Container(
                                height: 70.0,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 230, 230, 230),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                              color: subjectCard[index]
                                                  ['subColor'],
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Center(
                                            child: Text(
                                              subjectCard[index]['subCode'],
                                              textScaleFactor: 1.0,
                                              style: const TextStyle(
                                                  fontSize: 23.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            subjectCard[index]['subName'],
                                            style: kBodyBoldTextStyle,
                                            textScaleFactor: 1.0,
                                          ),
                                          const Spacer(),
                                          Text(
                                            subjectCard[index]['subTeacher'],
                                            style: kBodyLightTextStyle,
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
              const SizedBox(height: 45.0),

              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ));
  }
}
