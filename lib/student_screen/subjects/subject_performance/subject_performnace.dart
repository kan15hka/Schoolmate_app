import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/subjects/subject_performance/cycle_tests/cycle_tests.dart';
import 'package:schoolmate/student_screen/subjects/subject_performance/overall/overall.dart';
import 'package:schoolmate/student_screen/subjects/subject_performance/term_exams/term_exams.dart';

class SubjectPerformanceWidget extends StatefulWidget {
  final String subName;
  SubjectPerformanceWidget({super.key, required this.subName});

  @override
  State<SubjectPerformanceWidget> createState() =>
      _SubjectPerformanceWidgetState();
}

class _SubjectPerformanceWidgetState extends State<SubjectPerformanceWidget>
    with TickerProviderStateMixin {
  //Tab Controllers
  late TabController _tabController1;

  @override
  void initState() {
    _tabController1 = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController1.dispose();
  }

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
                child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  color: kAmberColor,
                  child: Center(
                    child: Text(
                      widget.subName,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontFamily: kOutfit,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded))
              ],
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25.0,
                      ),
                      //PERFORMANCE
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Performance',
                              textScaleFactor: 1.0,
                              style: kBodyBoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      //PERFORMANCE TAB BAR
                      Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: kLightGrey,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                            labelStyle: kBodyBoldTextStyleWhite,
                            unselectedLabelStyle: kBodyBoldTextStyle,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Color.fromARGB(255, 67, 108, 255)),
                            controller: _tabController1,
                            isScrollable: true,
                            tabs: [
                              Container(
                                width: width! * 0.24,
                                child: Tab(
                                    child: Text(
                                  'Overall',
                                  textScaleFactor: 1.0,
                                )),
                              ),
                              Container(
                                width: width! * 0.24,
                                child: Tab(
                                    child: Text(
                                  'Cycle Tests',
                                  textScaleFactor: 1.0,
                                )),
                              ),
                              Container(
                                width: width! * 0.24,
                                child: Tab(
                                    child: Text(
                                  'Term Exams',
                                  textScaleFactor: 1.0,
                                )),
                              )
                            ]),
                      ),
                      SizedBox(height: 15.0),
                      // PERFORMANCE TAB BAR VIEW
                      Flexible(
                        fit: FlexFit.tight,
                        child: TabBarView(
                          controller: _tabController1,
                          children: [
                            OverallPerformance(),
                            CycleTestsPerformance(),
                            TermExamsPerformance()
                          ],
                        ),
                      ),

                      Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
