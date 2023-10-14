import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/student_authenticaton/student_login/student_phone.dart';
import 'package:schoolmate/student_screen/home/dynamic_island.dart';
import 'package:schoolmate/student_screen/home/on_going_class.dart';
import 'package:schoolmate/student_screen/pages/attendance/attendance.dart';
import 'package:schoolmate/student_screen/pages/dummy_screen.dart';
import 'package:schoolmate/student_screen/pages/subjects/components/performance_graph.dart';
import 'package:schoolmate/student_screen/pages/subjects/subjects.dart';
import 'package:schoolmate/student_screen/pages/timetable/timetable.dart';
import 'package:schoolmate/widgets/background_widget.dart';
import '../../constants.dart';

class HomeWidget extends StatefulWidget {
  final VoidCallback openDrawer;
  const HomeWidget({super.key, required this.openDrawer});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //print(DateFormat.yMMMMEEEEd().format(DateTime.now()));
    // final List<Map<String, dynamic>> data = widget.studentData;
    // final int sindex = widget.studentIndex;
    Future<void> _handleRefresh() async {
      return await Future.delayed(const Duration(seconds: 2));
    }

    List<String> studentScreensText = [
      "HW",
      "EX",
      "TT",
      "ATT",
      "RES",
      "ACHI",
      "SUBS",
      "NOTI"
    ];
    List<Widget> studentScreens = [
      const DummyScreen(),
      const DummyScreen(),
      const TimeTablePage(),
      const AttendancePage(),
      const DummyScreen(),
      const DummyScreen(),
      const SubjectsPage(),
      const DummyScreen()
    ];
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: LiquidPullToRefresh(
            onRefresh: _handleRefresh,
            color: kSecondaryColor,
            backgroundColor: kPrimaryColor,
            height: 100.0,
            springAnimationDurationInMilliseconds: 300,
            animSpeedFactor: 1.5,
            showChildOpacityTransition: false,
            borderWidth: 2.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 130.0,
                    color: kPrimaryColor,
                    child: Stack(
                      children: [
                        Positioned(
                          height: 130.0,
                          top: 10.0,
                          width: 130.0,
                          right: kwidth! - 100.0,
                          child: HexagonSvg(130.0, 100.0, true, k2PrimaryColor,
                              k3PrimaryColor, 0.5),
                        ),
                        Positioned(
                          height: 130.0,
                          bottom: 20.0,
                          width: 130.0,
                          left: kwidth! - 100.0,
                          child: HexagonSvg(130.0, 100.0, true, k2PrimaryColor,
                              k3PrimaryColor, 0.5),
                        ),
                        //SCHOOL NAME AND ICONS
                        Positioned(
                          top: 10.0,
                          left: 0.0,
                          right: 0.0,
                          child: SizedBox(
                            //color: Colors.amber,
                            // padding: EdgeInsets.only(left: 20.0, right: 10.0),
                            height: 60.0,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: widget.openDrawer,
                                  icon: FaIcon(
                                    FontAwesomeIcons.alignLeft,
                                    color: kWhite,
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  height: 90.0,
                                  //color: Colors.red,
                                  child: Text(
                                    schoolName,
                                    textScaleFactor: 1.0,
                                    maxLines: 5,
                                    style: const TextStyle(
                                        //fontWeight: FontWeight.w600,
                                        fontSize: 23.0,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                )),
                                SizedBox(
                                  width: 100.0,
                                  height: 90,
                                  //color: kPrimaryColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius: 16.0,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          FontAwesomeIcons.bell,
                                          size: 20.0,
                                          color: k3PrimaryColor,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 16.0,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          MdiIcons.accountMultiple,
                                          size: 25.0,
                                          color: k3PrimaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //DYNAMIC ISLAND
                  const DynamicIslandHome(),
                  Container(
                    color: kWhite,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'HI, TYLER DURDEN',
                              ),
                              Text(
                                'TODAY\'S TIMELINE',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: k3GreyColor, fontSize: 14.0),
                              ),
                              Text(
                                DateFormat.yMMMMEEEEd()
                                    .format(DateTime.now())
                                    .toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                maxLines: 1,
                                style: TextStyle(
                                    color: k3GreyColor, fontSize: 14.0),
                              )
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'assets/leo.jpg',
                              height: 55.0,
                              width: 55.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const OnGoingClassHome(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                          color: kLSecondaryColor,
                          width: kwidth,
                          height: 500.0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                child: GridView.builder(
                                    itemCount: 8,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4),
                                    itemBuilder: ((context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      studentScreens[index]));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: kPrimaryColor,
                                                      width: 4.0))),
                                          child: Center(
                                              child: Text(
                                                  studentScreensText[index])),
                                        ),
                                      );
                                    })),
                              ),
                              const PerformanceGraph(),
                            ],
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentPhone()));
                          },
                          child: const Text("Student Authentiation"))
                    ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
