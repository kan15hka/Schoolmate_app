import 'package:flutter/material.dart';

import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/calendar/eventday_tabbar.dart';
import 'package:schoolmate/student_screen/calendar/selected_day.dart';
import 'package:schoolmate/widgets/background_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String currentMonth = "";
  Color markerColor = Colors.black;

  bool? onEventSelected;
  String eventDay = "";
  List<Map<String, String>> importantDayEventsList = [];
  List<Map<String, String>> occasionDayEventsList = [];
  List<Map<String, String>> holidayDayEventsList = [];
  //Events
  Map<DateTime, List<Map<String, String>>> events = {
    DateTime.utc(2023, 9, 7): [
      {
        "eventType": "H",
        "eventTitle": "DIWALI",
        "eventDesc":
            "DIWALI IS THE FESTIVAL OF LIGHTS.DIWALI IS BEIG CELEBRATED ALL OVER INDIA"
      },
      {
        "eventType": "I",
        "eventTitle": "ASSEMBLY",
        "eventDesc": "ASSEMBLY ON DIWALI"
      },
    ],
    DateTime.utc(2023, 9, 11): [
      {
        "eventType": "O",
        "eventTitle": "SPORTS MEET",
        "eventDesc": "SPORTS MEET IN SCHOOL"
      },
    ],
    DateTime.utc(2023, 9, 19): [
      {
        "eventType": "H",
        "eventTitle": "RAKSHA BANDHAN",
        "eventDesc":
            "DIWALI IS THE FESTIVAL OF LIGHTS.DIWALI IS BEIG CELEBRATED ALL OVER INDIA"
      },
    ],
    DateTime.utc(2023, 9, 29): [
      {
        "eventType": "O",
        "eventTitle": "ANNUAL DAY",
        "eventDesc": "ANNUAL DAY IN OUR SCHOOL"
      },
    ],
  };

  List<Map<String, String>> _getEventsDay(DateTime day) {
    return events[day] ?? [];
  }

  int importantDays = 0;
  int holidayDays = 0;
  int occasionDays = 0;
  void _getMonthEvents(String currentMonth) {
    setState(() {
      importantDayEventsList = [];
      holidayDayEventsList = [];
      occasionDayEventsList = [];
      events.forEach((key, value) {
        if (DateFormat('MM').format(key).toString() == currentMonth) {
          for (int i = 0; i < events[key]!.length; i++) {
            if (events[key]![i]["eventType"] == "I") {
              importantDays++;
              importantDayEventsList.add({
                "eventDate": DateFormat('dd-MM-yyyy').format(key).toString(),
                "eventDay": DateFormat('EEEE').format(key),
                "eventTitle": events[key]![i]["eventTitle"]!,
                "eventDesc": events[key]![i]["eventDesc"]!
              });
            } else if (events[key]![i]["eventType"] == "H") {
              holidayDays++;
              holidayDayEventsList.add({
                "eventDate": DateFormat('dd-MM-yyyy').format(key).toString(),
                "eventDay": DateFormat('EEEE').format(key),
                "eventTitle": events[key]![i]["eventTitle"]!,
                "eventDesc": events[key]![i]["eventDesc"]!
              });
            } else if (events[key]![i]["eventType"] == "O") {
              occasionDays++;
              occasionDayEventsList.add({
                "eventDate": DateFormat('dd-MM-yyyy').format(key).toString(),
                "eventDay": DateFormat('EEEE').format(key),
                "eventTitle": events[key]![i]["eventTitle"]!,
                "eventDesc": events[key]![i]["eventDesc"]!
              });
            }
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
    _getMonthEvents(currentMonth);
  }

  List<Map<String, String>> dayEvents = [];
  void _eventSelected(DateTime date) {
    dayEvents = events[date]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: BackgroundWidget(
          text: "CALENDAR",
          automaticallyImplyLeading: false,
          child: SingleChildScrollView(
            //physics: BouncingScrollPhysics(),
            child: Container(
              width: kwidth,
              decoration: BoxDecoration(
                color: kLSecondaryColor,

                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                //border: Border.all(color: k2GreyColor),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),

                  //TABLE CALENDAR
                  Container(
                    width: kwidth! * 0.9,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: k3GreyColor, width: 1.5),
                    ),
                    child: Column(
                      children: [
                        Container(
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
                              setState(() {
                                _focusedDay = focusedDay;
                                currentMonth = DateFormat('MM')
                                    .format(focusedDay)
                                    .toString();
                                importantDays = 0;
                                holidayDays = 0;
                                occasionDays = 0;
                                _getMonthEvents(currentMonth);
                              });
                            },

                            eventLoader: _getEventsDay,
                            holidayPredicate: (day) {
                              return day.weekday >= 7;
                            },
                            onDaySelected: (selectedDay, focusedDay) async {
                              if (!isSameDay(selectedDay, _selectedDay)) {
                                setState(() {
                                  dayEvents = [];
                                  onEventSelected = false;
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              }
                              if (events.containsKey(selectedDay)) {
                                setState(() {
                                  _eventSelected(selectedDay);
                                  onEventSelected = true;
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
                              markerBuilder:
                                  (BuildContext context, date, events) {
                                if (events.isEmpty) return const SizedBox();
                                return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: events.length,
                                    itemBuilder: (context, index) {
                                      String eventType =
                                          events[index].toString()[12];

                                      if (eventType == "I") {
                                        markerColor = importantColor;
                                      } else if (eventType == "H") {
                                        markerColor = holidayColor;
                                      } else {
                                        markerColor = occasionColor;
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
                              // singleMarkerBuilder: (context, date, event) {
                              //   if (event.toString() == "A") {
                              //     markerColor = kSemanticRed.withAlpha(150);
                              //   } else {
                              //     markerColor = kSemanticGreen.withAlpha(150);
                              //   }
                              //   eventDay =
                              //       DateFormat('d').format(date).toString();
                              //   return Container(
                              //     decoration: BoxDecoration(
                              //         shape: BoxShape.circle, color: markerColor),
                              //     width: 34.5,
                              //     height: 34.5,
                              //     child: Center(
                              //         child: Text(
                              //       eventDay,
                              //       style: TextStyle(color: Colors.white),
                              //     )),
                              //   );
                              // },
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
                                    color: kPrimaryColor,
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

                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border(
                                top:
                                    BorderSide(color: k3GreyColor, width: 1.5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IndicatorText(
                                  importantColor, importantDays, "IMPORTANT"),
                              IndicatorText(
                                  holidayColor, holidayDays, "HOLIDAY"),
                              IndicatorText(
                                  occasionColor, occasionDays, "OCCASION")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SelectedDayEvent(
                      selectedDay: _selectedDay!, dayEvents: dayEvents),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kwidth! * 0.1),
                    child: const Row(
                      children: [
                        Text("OVERALL MONTHLY EVENTS"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  EventDayTabBar(
                      importantDayEventsList: importantDayEventsList,
                      holidayDayEventsList: holidayDayEventsList,
                      occasionDayEventsList: occasionDayEventsList),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget IndicatorText(Color color, int number, String text) {
  return Row(
    children: [
      Container(
        height: 20.0,
        width: 20.0,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(color: kWhite, fontSize: 13.0),
          ),
        ),
      ),
      const SizedBox(width: 5.0),
      Text(
        text,
        style: TextStyle(color: k3GreyColor, fontSize: 13.0),
      )
    ],
  );
}
