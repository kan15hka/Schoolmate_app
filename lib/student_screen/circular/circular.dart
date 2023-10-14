import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/widgets/background_widget.dart';

class CircularScreen extends StatefulWidget {
  const CircularScreen({super.key});

  @override
  State<CircularScreen> createState() => _CircularScreenState();
}

class _CircularScreenState extends State<CircularScreen> {
  //List onCardTapped = [];

  int today = 0;
  int yesterday = 0;
  int old = 0;
  List<Map<String, dynamic>> circulars = [
    {
      "date":
          DateTime.now().subtract(const Duration(days: 10, hours: 5, minutes: 26)),
      "time": "06:30 PM",
      "circularTitle": "PARENTS MEETING",
      "circularDesc":
          "PARENTS MEETING ABOUT TO BE HELD IN OUR SCHOOL ON 15-08-2003 AT 04:00 PM"
    },
    {
      "date": DateTime.now(),
      "time": "06:30 PM",
      "circularTitle": "SYLLABUS CHANGE",
      "circularDesc": "THERE IS A CHANGE I THE SCHOOL SYLLABUS FOR STUDENTS."
    },
    {
      "date": DateTime.now().subtract(const Duration(hours: 1, minutes: 8)),
      "time": "06:30 PM",
      "circularTitle": "PRINCIPAL RETIRMENT",
      "circularDesc": "OUR PRINCIPAL RETIRES."
    },
    {
      "date": DateTime.now().subtract(const Duration(days: 1, hours: 8, minutes: 35)),
      "time": "06:30 PM",
      "circularTitle": "FREE MEAL",
      "circularDesc": "FREE MEAL FOR STUDENTS AT AUDITORIUM"
    },
    {
      "date": DateTime.now().subtract(const Duration(days: 1, hours: 8, minutes: 35)),
      "time": "06:30 PM",
      "circularTitle": "HALF DAY",
      "circularDesc": "TOMMORROW IS COSIDERED HALF WORKING DAY"
    },
  ];
  void circularList() {
    circulars = circulars.map((absentDay) => absentDay).toList()
      ..sort((a, b) => b["date"]!.compareTo(a["date"]!));
    for (var element in circulars) {
      String date = DateFormat('dd-MM-yyyy').format(element["date"]);
      String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
      String yesterdayDate = DateFormat('dd-MM-yyyy')
          .format(DateTime.now().subtract(const Duration(days: 1)));
      if (date == todayDate) {
        element["receiveStatus"] = "RECENTS";
      } else if (date == yesterdayDate) {
        element["receiveStatus"] = "YESTERDAY";
      } else {
        element["receiveStatus"] = "OLD CIRCULARS";
      }
    }
    for (int i = 0; i < circulars.length; i++) {
      if (i == 0) {
        circulars[i]["receiveStatusFirst"] = true;
      } else if (circulars[i]["receiveStatus"] !=
          circulars[i - 1]["receiveStatus"]) {
        circulars[i]["receiveStatusFirst"] = true;
      } else {
        circulars[i]["receiveStatusFirst"] = false;
      }
    }
  }

  // void setCardTappedFalse() {
  //   for (int i = 0; i < circulars.length; i++) {
  //     onCardTapped.add(false);
  //   }
  // }

  @override
  void initState() {
    super.initState();

    circularList();
    //setCardTappedFalse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: ScreenAppBar("CIRCULAR", false, context),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kwidth! * 0.06),
              child: Row(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TODAY\'S TIMELINE',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: k3GreyColor, fontSize: 14.0),
                        ),
                        Text(
                          DateFormat.yMMMMEEEEd()
                              .format(DateTime.now())
                              .toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(color: k3GreyColor, fontSize: 14.0),
                        ),
                      ]),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            AnimationLimiter(
              child: Expanded(
                child: Container(
                  color: kLSecondaryColor,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: circulars.length,
                    itemBuilder: (context, index) {
                      String date = DateFormat('dd-MM-yyyy')
                          .format(circulars[index]["date"]);

                      String time =
                          DateFormat.jm().format(circulars[index]["date"]);
                      String circularTitle = circulars[index]["circularTitle"];
                      String circularDesc = circulars[index]["circularDesc"];
                      bool receiveStatusFirst =
                          circulars[index]["receiveStatusFirst"];

                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 20.0,
                          child: FadeInAnimation(
                            child: InkWell(
                              // onTap: () {
                              //   setState(() {
                              //     onCardTapped[index] = !onCardTapped[index];
                              //   });
                              // },
                              child: Column(
                                children: [
                                  // (index == 0 && receiveStatusFirst)
                                  //     ? Padding(
                                  //         padding: EdgeInsets.only(
                                  //             left: kwidth! * 0.08, bottom: 5.0),
                                  //         child: Row(
                                  //           children: [
                                  //             Text(circulars[index]
                                  //                 ["receiveStatus"]),
                                  //           ],
                                  //         ),
                                  //       )
                                  //     : Container(),
                                  (receiveStatusFirst)
                                      ? Column(
                                          children: [
                                            Divider(
                                              thickness: 1.5,
                                              color: k1GreyColor,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: kwidth! * 0.08,
                                                  bottom: 5.0),
                                              child: Row(
                                                children: [
                                                  Text(circulars[index]
                                                      ["receiveStatus"]),
                                                ],
                                              ),
                                            ),
                                            // Divider(
                                            //   thickness: 1.5,
                                            //   color: k1GreyColor,
                                            // ),
                                          ],
                                        )
                                      : Container(),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            color: k3GreyColor, width: 1.5)),
                                    margin: EdgeInsets.only(
                                        left: kwidth! * 0.06,
                                        right: kwidth! * 0.06,
                                        bottom: 10.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            RichTextCard(MdiIcons.clock, time),
                                            RichTextCard(
                                                FontAwesomeIcons.calendarDays,
                                                date)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Text(
                                            circularTitle,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: k4GreyColor),
                                          ),
                                        ),
                                        Text(
                                          circularDesc,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 5,
                                          //maxLines: onCardTapped[index] ? 5 : 2,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: k3GreyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
