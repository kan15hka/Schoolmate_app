import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/constants.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeTableBuilder extends StatefulWidget {
  final String day;
  final List<Map<String, String>> timetableList;
  const TimeTableBuilder(
      {super.key, required this.day, required this.timetableList});

  @override
  State<TimeTableBuilder> createState() => _TimeTableBuilderState();
}

class _TimeTableBuilderState extends State<TimeTableBuilder> {
  // int iColors = 0;
  // int totalBreaks = 3;
  List<Color> timetableListColors = [];
  void _assignListColors(List<Map<String, String>> timetableList) {
    int i = 0;
    for (var element in timetableList) {
      if (element["periodType"]![0] == "p") {
        timetableListColors.add(kListColors[i]);
        i++;
      } else {
        timetableListColors.add(kSecondaryColor);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _assignListColors(widget.timetableList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.day,
          style: TextStyle(color: k3GreyColor),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: Container(
              color: kLSecondaryColor,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.timetableList.length,
                  itemBuilder: (context, index) {
                    return PeriodTimeLineTile(widget.timetableList, index);
                  })),
        ),
      ],
    );
  }

  Widget PeriodTimeLineTile(List<Map<String, String>> dayTimeTable, int index) {
    String periodType = dayTimeTable[index]["periodType"]!;
    String startTime = dayTimeTable[index]["startTime"]!;
    String endTime = dayTimeTable[index]["endTime"]!;
    String subjectName = "";
    String subjectTeacher = "";
    bool isLeisure = false;
    bool isBreak = false;
    if (periodType[0] != "p") {
      isLeisure = true;
      if (periodType == "break") {
        isBreak = true;
      }
    } else {
      subjectName = dayTimeTable[index]["subjectName"]!;
      subjectTeacher = dayTimeTable[index]["subjectTeacher"]!;
    }
    //Check the period state
    String periodStatus = "";
    //Start Time
    DateTime startDateTime = DateFormat("h:mm a").parse(startTime);
    double start = startDateTime.hour + startDateTime.minute / 60.0;
    //End Time
    DateTime endDateTime = DateFormat("h:mm a").parse(endTime);
    double end = endDateTime.hour + endDateTime.minute / 60.0;
    //current time
    DateTime currentDate = DateTime.now();
    double current = currentDate.hour + currentDate.minute / 60.0;

    if (current > end) {
      periodStatus = "past";
    } else if (current >= start && current <= end) {
      periodStatus = "present";
    } else if (current < start) {
      periodStatus = "future";
    }
    // if (iColors >= dayTimeTable.length - totalBreaks) {
    //   iColors = dayTimeTable.length - totalBreaks - 1;
    // }
    //print(iColors);
    return Padding(
      padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: (index == 0) ? 10.0 : 0.0,
          bottom: (index == dayTimeTable.length - 1) ? 30.0 : 0.0),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.225,
        isFirst: (index == 0) ? true : false,
        isLast: (index == dayTimeTable.length - 1) ? true : false,
        hasIndicator: true,
        beforeLineStyle: LineStyle(
            color: (periodStatus == "future") ? kSecondaryColor : kPrimaryColor,
            thickness: 3.0),
        afterLineStyle: LineStyle(
            color: !(periodStatus == "past") ? kSecondaryColor : kPrimaryColor,
            thickness: 3.0),
        indicatorStyle: IndicatorStyle(
          indicator: (periodStatus == "past")
              //Past widget
              ? Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                      color: kPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    FontAwesomeIcons.check,
                    color: kWhite,
                    size: 15.0,
                  ))
              //Present widget
              : (periodStatus == "present")
                  ? Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                          color: kLSecondaryColor, shape: BoxShape.circle),
                      child: CircularProgressIndicator(
                        color: kLSecondaryColor,
                        backgroundColor: kPrimaryColor,
                        strokeWidth: 4.0,
                        strokeCap: StrokeCap.round,
                      ))
                  : Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                          color: kSecondaryColor, shape: BoxShape.circle),
                    ),
          color: kSecondaryColor,
          height: 25.0,
          width: 25.0,
        ),
        startChild: Container(
          child: Text(
            "$startTime\nTO\n$endTime",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0, color: k3GreyColor),
          ),
        ),
        endChild: (isLeisure)
            ? (isBreak)
                ? Center(
                    child: Text(
                    "SNACK BREAK",
                    style: TextStyle(color: k3GreyColor),
                  ))
                : Center(
                    child: Text(
                    "LUNCH BREAK",
                    style: TextStyle(color: k3GreyColor),
                  ))
            : Container(
                constraints: const BoxConstraints(
                  minHeight: 90.0,
                ),
                padding: const EdgeInsets.all(5.0),
                //color: Colors.lightGreenAccent,
                child: Container(
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: timetableListColors[index],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                periodType[1],
                                style: TextStyle(
                                    color: kWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                subjectName,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: kWhite, fontSize: 15.0),
                              ),
                            ),
                            const SizedBox(
                              width: 3.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 25.0,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)),
                          border: Border.all(color: k3GreyColor, width: 1.5)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              subjectTeacher,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: k3GreyColor,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
      ),
    );
  }
}
