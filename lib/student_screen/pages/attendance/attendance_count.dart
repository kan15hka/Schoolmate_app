import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';

class AttendanceCount extends StatefulWidget {
  final int workingDays;
  final int presentDays;
  final int absentDays;
  const AttendanceCount(
      {super.key,
      required this.workingDays,
      required this.presentDays,
      required this.absentDays});

  @override
  State<AttendanceCount> createState() => _AttendanceCountState();
}

class _AttendanceCountState extends State<AttendanceCount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DayCount("WORKING DAYS", widget.workingDays.toString(), kPrimaryColor),
        DayCount("PRESENT DAYS", widget.presentDays.toString(), kSemanticGreen),
        DayCount("ABSENT DAYS", widget.absentDays.toString(), kSemanticRed),
      ],
    );
  }
}

Widget DayCount(String title, String days, Color color) {
  return Container(
    height: 50.0,
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.0, color: k4GreyColor),
        ),
        Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              days,
              style: TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.bold, color: kWhite),
            ),
          ),
        ),
      ],
    ),
  );
}
