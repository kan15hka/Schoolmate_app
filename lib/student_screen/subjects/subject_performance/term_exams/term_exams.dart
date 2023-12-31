import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

import 'package:schoolmate/student_screen/subjects/subject_performance/term_exams/all_term_exams.dart';
import 'package:schoolmate/student_screen/subjects/subject_performance/term_exams/te_analysis.dart';

class TermExamsPerformance extends StatefulWidget {
  const TermExamsPerformance({super.key});

  @override
  State<TermExamsPerformance> createState() => _TermExamsPerformanceState();
}

class _TermExamsPerformanceState extends State<TermExamsPerformance>
    with TickerProviderStateMixin {
  //Tab Controllers
  late TabController _tabController3;

  @override
  void initState() {
    _tabController3 = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 241, 241, 241),
      child: Column(children: [
        Container(
          height: 40.0,
          decoration: BoxDecoration(color: Color.fromARGB(255, 241, 241, 241)),
          child: TabBar(
              labelColor: Color.fromARGB(255, 67, 108, 255),
              unselectedLabelColor: Colors.black,
              labelStyle: kBodyBoldTextStyleWhite,
              unselectedLabelStyle: kBodyBoldTextStyle,
              indicator: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 67, 108, 255), width: 2)),
              controller: _tabController3,
              isScrollable: true,
              tabs: [
                Container(
                  width: width! * 0.42,
                  child: Tab(
                      child: Text(
                    'All Term Exams',
                    textScaleFactor: 1.0,
                  )),
                ),
                Container(
                  width: width! * 0.42,
                  child: Tab(
                      child: Text(
                    'Analysis',
                    textScaleFactor: 1.0,
                  )),
                ),
              ]),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: TabBarView(
            controller: _tabController3,
            children: [
              AllTermExams(),
              TEAnalysis(),
            ],
          ),
        ),
      ]),
    );
  }
}
