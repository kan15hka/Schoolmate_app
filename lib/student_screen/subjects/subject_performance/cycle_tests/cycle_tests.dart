import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/subjects/subject_performance/cycle_tests/all_cycle_tests.dart';
import 'package:schoolmate/student_screen/subjects/subject_performance/cycle_tests/ct_analysis.dart';

class CycleTestsPerformance extends StatefulWidget {
  const CycleTestsPerformance({super.key});

  @override
  State<CycleTestsPerformance> createState() => _CycleTestsPerformanceState();
}

class _CycleTestsPerformanceState extends State<CycleTestsPerformance>
    with TickerProviderStateMixin {
  //Tab Controllers
  late TabController _tabController2;

  @override
  void initState() {
    _tabController2 = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController2.dispose();
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
              controller: _tabController2,
              isScrollable: true,
              tabs: [
                Container(
                  width: width! * 0.42,
                  child: Tab(
                      child: Text(
                    'All Cycle Tests',
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
            controller: _tabController2,
            children: [
              AllCycleTests(),
              CTAnalysis(),
            ],
          ),
        ),
      ]),
    );
  }
}
