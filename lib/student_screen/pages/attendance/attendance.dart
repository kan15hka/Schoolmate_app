import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/pages/attendance/absents_list.dart';
import 'package:schoolmate/student_screen/pages/attendance/attendance_count.dart';
import 'package:schoolmate/widgets/background_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String currentMonth = "";
  Color markerColor = Colors.black;
  Color selectedColor = Colors.black;

  bool onEventSelected = false;
  String attendanceDay = "";
  int workingDaysMonth = 0;
  int presentDaysMonth = 0;
  int absentDaysMonth = 0;
  int overallWorkingDays = 0;
  int overallPresentDays = 0;
  int overallAbsentDays = 0;
  double attendancePercent = 0.0;
  //Events
  Map<DateTime, List<dynamic>> attendance = {
    DateTime.utc(2023, 9, 10): ["P"],
    DateTime.utc(2023, 9, 11): ["P"],
    DateTime.utc(2023, 9, 12): ["A"],
    DateTime.utc(2023, 9, 13): ["A"],
    DateTime.utc(2023, 9, 14): ["A"],
    DateTime.utc(2023, 9, 15): ["P"],
    DateTime.utc(2023, 9, 16): ["A"],
    DateTime.utc(2023, 9, 17): ["P"],
    DateTime.utc(2023, 9, 18): ["P"],
    DateTime.utc(2023, 9, 19): ["A"],
    DateTime.utc(2023, 9, 20): ["P"],
    DateTime.utc(2023, 10, 12): ["A"],
    DateTime.utc(2023, 10, 20): ["P"],
    DateTime.utc(2023, 11, 20): ["A"]
  };

  List<Map<String, String>> absentsList = [];

  List<dynamic> _getAttendance(DateTime day) {
    return attendance[day] ?? [];
  }

  void _overallAttendance() {
    attendance.forEach((key, value) {
      setState(() {
        overallWorkingDays++;
        if (attendance[key]![0].toString() == "A") {
          absentsList.add({
            "date": DateFormat('yyyy-MM-dd').format(key).toString(),
            "session": "FULL DAY",
            "reason": "-"
          });

          overallAbsentDays++;
        } else {
          overallPresentDays++;
        }
        attendancePercent =
            overallPresentDays.toDouble() / overallWorkingDays.toDouble();
      });
    });

    absentsList = absentsList.map((absentDay) => absentDay).toList()
      ..sort((a, b) => a["date"]!.compareTo(b["date"]!));
  }

  void _monthAttendance(String currentMonth) {
    attendance.forEach((key, value) {
      setState(() {
        if (DateFormat('MM').format(key).toString() == currentMonth) {
          workingDaysMonth++;
          if (attendance[key]![0].toString() == "A") {
            absentDaysMonth++;
          } else {
            presentDaysMonth++;
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    currentMonth = DateFormat('MM').format(_focusedDay).toString();
    _monthAttendance(currentMonth);
    _overallAttendance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: BackgroundWidget(
          text: "ATTENDANCE",
          automaticallyImplyLeading: true,
          child: Container(
            decoration: BoxDecoration(
              color: kLSecondaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),

                //TABLE CALENDAR
                Container(
                  width: kwidth! * 0.9,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: k2GreyColor, width: 1.5),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TableCalendar(
                          focusedDay: _focusedDay,
                          firstDay: DateTime.utc(2022, 12, 12),
                          lastDay: DateTime.utc(2023, 12, 30),
                          calendarFormat: _calendarFormat,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                            currentMonth =
                                DateFormat('MM').format(focusedDay).toString();
                            workingDaysMonth = 0;
                            absentDaysMonth = 0;
                            presentDaysMonth = 0;
                            _monthAttendance(currentMonth);
                          },

                          eventLoader: _getAttendance,
                          holidayPredicate: (day) {
                            return day.weekday >= 7;
                          },
                          onDaySelected: (selectedDay, focusedDay) async {
                            if (!isSameDay(selectedDay, _selectedDay)) {
                              setState(() {
                                onEventSelected = false;
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }
                            if (attendance.containsKey(selectedDay)) {
                              setState(() {
                                onEventSelected = true;

                                if (attendance[selectedDay]![0] == "A") {
                                  selectedColor = kSemanticRed;
                                } else {
                                  selectedColor = kSemanticGreen;
                                }
                              });
                            }
                          },

                          calendarBuilders: CalendarBuilders(
                            headerTitleBuilder: (context, day) {
                              return Center(
                                child: Text(
                                  "${DateFormat.LLLL().format(day).toUpperCase()} ${DateFormat.y().format(day).toUpperCase()}",
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              );
                            },
                            dowBuilder: (context, day) => Center(
                              child: Text(
                                DateFormat.E().format(day).toUpperCase(),
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ),
                            //
                            markerBuilder:
                                (BuildContext context, date, events) {
                              if (events.isEmpty) return const SizedBox();
                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: events.length,
                                  itemBuilder: (context, index) {
                                    String attendanceStatus =
                                        events[index].toString();

                                    if (attendanceStatus == "A") {
                                      markerColor = kSemanticRed;
                                    } else {
                                      markerColor = kSemanticGreen;
                                    }
                                    return Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      padding: const EdgeInsets.all(1),
                                      child: Container(
                                        // height: 7,
                                        width: 6,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: markerColor),
                                      ),
                                    );
                                  });
                            },
                          ),
                          calendarStyle: CalendarStyle(
                              outsideDaysVisible: false,
                              // markerDecoration:
                              //     BoxDecoration(shape: BoxShape.circle),
                              // markerSizeScale: 1,
                              // markerMargin: EdgeInsets.all(0.0),
                              // markersAlignment: Alignment.center,
                              // markersAutoAligned: true,
                              // markersAnchor: 1,
                              // canMarkersOverflow: false,
                              todayDecoration: const BoxDecoration(
                                color: Color.fromARGB(255, 171, 248, 255),
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                  color: (onEventSelected)
                                      ? selectedColor
                                      : kPrimaryColor,
                                  shape: BoxShape.circle)),

                          headerStyle: const HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                              // titleTextStyle:
                              //     TextStyle(fontWeight: FontWeight.w500),
                              leftChevronMargin: EdgeInsets.all(0.0),
                              rightChevronMargin: EdgeInsets.all(0.0)),
                          //availableGestures: AvailableGestures.all,
                        ),
                      ),
                      //MONTH  ATTENDANCE
                      Container(
                          height: 65.0,
                          decoration: BoxDecoration(
                            border: Border(
                                top:
                                    BorderSide(color: k3GreyColor, width: 1.5)),
                          ),
                          child: AttendanceCount(
                              workingDays: workingDaysMonth,
                              presentDays: presentDaysMonth,
                              absentDays: absentDaysMonth)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),

                Container(
                    width: kwidth! * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: k2GreyColor, width: 1.5)),
                    height: 130.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20.0,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: k2GreyColor, width: 1.5)),
                          ),
                          child: Center(
                            child: Text(
                              "OVERALL ATTENDANCE",
                              style:
                                  TextStyle(fontSize: 14.0, color: k4GreyColor),
                            ),
                          ),
                        ),
                        AttendanceCount(
                            workingDays: overallWorkingDays,
                            presentDays: overallPresentDays,
                            absentDays: overallAbsentDays),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: LinearPercentIndicator(
                            animation: true,
                            lineHeight: 20.0,
                            animationDuration: 1000,
                            percent: attendancePercent,
                            center: Text(
                              "${(attendancePercent * 100).toStringAsFixed(2)} %",
                              style: TextStyle(
                                  color: kWhite,
                                  fontSize: 13.0,
                                  fontFamily: kFontFamily),
                            ),
                            barRadius: const Radius.circular(10.0),
                            progressColor: kSemanticGreen,
                            backgroundColor: kSemanticRed,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AbsentsList(
                                  attendancePercent: attendancePercent,
                                  absentsList: absentsList)));
                    },
                    style: kSecondaryButton,
                    child: Text(
                      "VIEW ALL ABSENTS",
                      style: kBodyLightTextStyle,
                    )),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ));
  }
}
