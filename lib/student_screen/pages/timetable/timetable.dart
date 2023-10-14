import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/pages/timetable/tt_builder.dart';
import 'package:schoolmate/widgets/background_widget.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({super.key});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Map<String, List<Map<String, String>>> timetable = {
    "MON": [
      {
        "periodType": "p1",
        "startTime": "09:00 AM",
        "endTime": "09:45 AM",
        "subjectName": "PH4561 - PHYSICS",
        "subjectTeacher": "MR. JACK DANIELS"
      },
      {
        "periodType": "p2",
        "startTime": "09:45 AM",
        "endTime": "10:30 AM",
        "subjectName": "MA6351 - MATHEMATICS",
        "subjectTeacher": "MR. JACK DANIELS"
      },
      {
        "periodType": "break",
        "startTime": "10:30 AM",
        "endTime": "10:45 AM",
      },
      {
        "periodType": "p3",
        "startTime": "10:45 AM",
        "endTime": "11:30 AM",
        "subjectName": "EN4589 - ENGLISH",
        "subjectTeacher": "MR. JACK DANIELS"
      },
      {
        "periodType": "p4",
        "startTime": "11:30 AM",
        "endTime": "12:15 PM",
        "subjectName": "TA7895 - TAMIL",
        "subjectTeacher": "MR. JACK DANIELS"
      },
      {
        "periodType": "lunch",
        "startTime": "12:15 PM",
        "endTime": "01:00 PM",
      },
      {
        "periodType": "p5",
        "startTime": "01:00 PM",
        "endTime": "01:45 PM",
        "subjectName": "CH5562 - CHEMISTRY",
        "subjectTeacher": "MR. JACK DANIELS"
      },
      {
        "periodType": "p6",
        "startTime": "01:45 PM",
        "endTime": "02:30 PM",
        "subjectName": "BI8961 - BIOLOGY",
        "subjectTeacher": "MR. JACK DANIELS"
      },
      {
        "periodType": "break",
        "startTime": "02:30 PM",
        "endTime": "02:45 PM",
      },
      {
        "periodType": "p7",
        "startTime": "02:45 PM",
        "endTime": "03:30 PM",
        "subjectName": "CS4523 - COMPUTER SCIENCE",
        "subjectTeacher": "MR. JACK DANIELS"
      },
      {
        "periodType": "p8",
        "startTime": "03:30 PM",
        "endTime": "04:15 PM",
        "subjectName": "EVS456 - ENVIRONMENTAL SCIENCE",
        "subjectTeacher": "MR. JACK DANIELS"
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: ScreenAppBar("TIMETABLE", true, context),
      body: Container(
        width: kwidth,
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              height: 40.0,
              width: kwidth! * 0.9,
              child: TabBar(
                  physics: const BouncingScrollPhysics(),
                  unselectedLabelColor: kPrimaryColor,
                  labelPadding: EdgeInsets.zero,
                  labelStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: kFontFamily),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 15.0,
                      color: kPrimaryColor,
                      fontFamily: kFontFamily),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: kPrimaryColor),
                  controller: _tabController,
                  isScrollable: false,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  //tabAlignment: TabAlignment.center,
                  //labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  tabs: [
                    TimeTableDayTab("MON"),
                    TimeTableDayTab("TUE"),
                    TimeTableDayTab("WED"),
                    TimeTableDayTab("THU"),
                    TimeTableDayTab("FRI"),
                    TimeTableDayTab("SAT")
                  ]),
            ),
            const SizedBox(
              height: 5.0,
            ),
            // //TAB BAR VIEW
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  //PAYMENT
                  TimeTableBuilder(
                    day: "MONDAY",
                    timetableList: timetable["MON"]!,
                  ),
                  TimeTableBuilder(
                    day: "TUESDAY",
                    timetableList: timetable["MON"]!,
                  ),
                  TimeTableBuilder(
                    day: "WEDNESDAY",
                    timetableList: timetable["MON"]!,
                  ),
                  TimeTableBuilder(
                    day: "THURSDAY",
                    timetableList: timetable["MON"]!,
                  ),
                  TimeTableBuilder(
                    day: "FRIDAY",
                    timetableList: timetable["MON"]!,
                  ),
                  TimeTableBuilder(
                    day: "SATURDAY",
                    timetableList: timetable["MON"]!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget TimeTableDayTab(String day) {
  return Tab(
      child: Container(
    width: 40.0,
    height: 40.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0.0),
    ),
    child: Center(
      child: Text(
        day,
        textScaleFactor: 1.0,
        style: const TextStyle(fontSize: 13.0),
      ),
    ),
  ));
}
