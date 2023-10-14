import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/services.dart';
import 'package:schoolmate/student_screen/calendar/calender.dart';
import 'package:schoolmate/student_screen/circular/circular.dart';
import 'package:schoolmate/student_screen/fees/fees.dart';
import 'package:schoolmate/student_screen/home/home.dart';
import 'package:schoolmate/student_screen/profile/profile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StudentScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const StudentScreen({super.key, required this.openDrawer});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int _currentIndex = 2;
  //NAV BAR ITEMS
  List<IconData> navBarIcons = [
    FontAwesomeIcons.calendarDays,
    MdiIcons.messageText,
    FontAwesomeIcons.house,
    FontAwesomeIcons.handHoldingDollar,
    FontAwesomeIcons.user,
  ];
  List<String> navBarText = ['CALENDAR', 'CIRCULAR', 'HOME', 'FEES', 'PROFILE'];

  //NAV BAR WIDGETS
  List<Widget> navBarWidgets = [];
  @override
  void initState() {
    super.initState();
    navBarWidgets = [
      const CalendarScreen(),
      const CircularScreen(),
      HomeWidget(
        openDrawer: widget.openDrawer,
      ),
      const FeesScreen(),
      ProfileWidget(studentData: ApiServices().studentData, studentIndex: 0)
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: navBarWidgets[_currentIndex],
      bottomNavigationBar: Container(
        color: kLSecondaryColor,
        padding:
            const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    margin: EdgeInsets.only(
                      bottom: index == _currentIndex ? 0 : size.width * .029,
                      right: size.width * .025,
                      left: size.width * .025,
                    ),
                    width: size.width * .128,
                    height: index == _currentIndex ? size.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: k3PrimaryColor,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    navBarIcons[index],
                    size: 20.0,
                    color:
                        index == _currentIndex ? k3PrimaryColor : k4GreyColor,
                  ),
                  Text(
                    navBarText[index],
                    style: TextStyle(
                      fontSize: 10.0,
                      //fontWeight: FontWeight.bold,
                      color:
                          index == _currentIndex ? k3PrimaryColor : k4GreyColor,
                    ),
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
