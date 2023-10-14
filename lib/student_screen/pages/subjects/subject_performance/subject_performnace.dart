import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/pages/subjects/subject_performance/cycle_tests/cycle_tests.dart';
import 'package:schoolmate/student_screen/pages/subjects/subject_performance/overall/overall.dart';
import 'package:schoolmate/student_screen/pages/subjects/subject_performance/term_exams/term_exams.dart';
import 'package:schoolmate/widgets/background_widget.dart';

class SubjectPerformanceWidget extends StatefulWidget {
  final String subName;
  const SubjectPerformanceWidget({super.key, required this.subName});

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
      backgroundColor: kPrimaryColor,
      body: BackgroundWidget(
        text: widget.subName,
        automaticallyImplyLeading: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
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
            const SizedBox(
              height: 15.0,
            ),
            //PERFORMANCE TAB BAR
            Container(
              height: 40.0,
              decoration: BoxDecoration(
                  color: k3GreyColor,
                  borderRadius: BorderRadius.circular(50.0)),
              child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
                  labelStyle: kBodyBoldTextStyleWhite,
                  unselectedLabelStyle: kBodyBoldTextStyle,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: const Color.fromARGB(255, 67, 108, 255)),
                  controller: _tabController1,
                  isScrollable: true,
                  tabs: [
                    SizedBox(
                      width: kwidth! * 0.24,
                      child: const Tab(
                          child: Text(
                        'Overall',
                        textScaleFactor: 1.0,
                      )),
                    ),
                    SizedBox(
                      width: kwidth! * 0.24,
                      child: const Tab(
                          child: Text(
                        'Cycle Tests',
                        textScaleFactor: 1.0,
                      )),
                    ),
                    SizedBox(
                      width: kwidth! * 0.24,
                      child: const Tab(
                          child: Text(
                        'Term Exams',
                        textScaleFactor: 1.0,
                      )),
                    )
                  ]),
            ),
            const SizedBox(height: 15.0),
            // PERFORMANCE TAB BAR VIEW
            Flexible(
              fit: FlexFit.tight,
              child: TabBarView(
                controller: _tabController1,
                children: const [
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
      ),
    );
  }
}
