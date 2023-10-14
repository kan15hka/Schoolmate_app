import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/constants.dart';

class SelectedDayEvent extends StatefulWidget {
  final List<Map<String, String>> dayEvents;
  final DateTime selectedDay;
  const SelectedDayEvent(
      {super.key, required this.selectedDay, required this.dayEvents});

  @override
  State<SelectedDayEvent> createState() => _SelectedDayEventState();
}

class _SelectedDayEventState extends State<SelectedDayEvent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: kwidth! * 0.85,
          height: 25.0,
          decoration: BoxDecoration(
              color: k4GreyColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Center(
            child: Text(
              "SELECTED DAY",
              style: TextStyle(fontSize: 14.0, color: kWhite),
            ),
          ),
        ),
        Container(
          width: kwidth! * 0.85,
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              border: Border.all(color: k3GreyColor, width: 1.5)),
          child: (widget.dayEvents.isEmpty)
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                      child: Text(
                    "NO EVENTS FOUND",
                    style: TextStyle(color: k3GreyColor, fontSize: 14.0),
                  )),
                )
              : MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.dayEvents.length,
                    itemBuilder: ((context, index) {
                      String eventType = widget.dayEvents[index]["eventType"]!;
                      String eventTitle =
                          widget.dayEvents[index]["eventTitle"]!;
                      String eventDesc = widget.dayEvents[index]["eventDesc"]!;
                      String date =
                          DateFormat('dd-MM-yyyy').format(widget.selectedDay);
                      String day =
                          DateFormat('EEEE').format(widget.selectedDay);
                      Color markerColor;
                      if (eventType == "I") {
                        markerColor = importantColor;
                      } else if (eventType == "H") {
                        markerColor = holidayColor;
                      } else {
                        markerColor = occasionColor;
                      }

                      return Container(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(children: [
                                Container(
                                  height: 12.0,
                                  width: 12.0,
                                  decoration: BoxDecoration(
                                      color: markerColor,
                                      borderRadius: BorderRadius.circular(2.0)),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Text(eventTitle),
                                ),
                                RichTextCard(
                                    FontAwesomeIcons.calendarDays, date),
                                RichTextCard(MdiIcons.clock, day.toUpperCase())
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                eventDesc,
                                style: TextStyle(
                                    color: k3GreyColor, fontSize: 14.0),
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            if (index != widget.dayEvents.length - 1)
                              Divider(
                                thickness: 1.5,
                                color: k3GreyColor,
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
        ),
      ],
    );
  }
}

Widget RichTextCard(IconData iconData, String text) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Text.rich(
      TextSpan(
        style: TextStyle(fontSize: 13.0, color: k3GreyColor),
        children: [
          WidgetSpan(
            child: Icon(iconData, size: 17.0, color: k3GreyColor),
          ),
          TextSpan(text: " $text"),
        ],
      ),
    ),
  );
}
