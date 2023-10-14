import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/widgets/background_widget.dart';

class AbsentsList extends StatefulWidget {
  final double attendancePercent;
  final List<Map<String, String>> absentsList;
  const AbsentsList(
      {super.key, required this.attendancePercent, required this.absentsList});

  @override
  State<AbsentsList> createState() => _AbsentsListState();
}

class _AbsentsListState extends State<AbsentsList> {
  //final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: PageAppBar("ABSENTS LIST", true, context),
        body: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 10.0,
                    animation: true,
                    percent: widget.attendancePercent,
                    // center: new Text(
                    //   "${(widget.attendancePercent * 100).toStringAsFixed(2)} %",
                    //   style: TextStyle(fontSize: 14.0),
                    // ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: kSemanticGreen,
                    backgroundColor: kSemanticRed,
                    startAngle: 315.0,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${(widget.attendancePercent * 100).toStringAsFixed(2)} % ATTENDANCE",
                        maxLines: 3,
                      ),
                      (widget.attendancePercent > 0.75)
                          ? Text(
                              "CONGRATS!! YOU ARE ON\nTHE TRACK",
                              style:
                                  TextStyle(fontSize: 14.0, color: k4GreyColor),
                            )
                          : Text(
                              "OOPS!! YOUR ATTENANCE\nIS LOW ",
                              style:
                                  TextStyle(fontSize: 14.0, color: k4GreyColor),
                            )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                color: kLSecondaryColor,
                width: kwidth,
                child: Center(
                  child: Text(
                    "OVERALL ABSENTS LIST",
                    style: TextStyle(fontSize: 15.0, color: k3GreyColor),
                  ),
                ),
              ),
              //LIST VIEW BUILDER
              Expanded(
                child: Container(
                  height: kheight! - 200.0,
                  color: kLSecondaryColor,
                  child: ListView.builder(
                      //controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.absentsList.length,
                      itemBuilder: (context, index) {
                        //Conversion of reversed date due to sorting to dd-mm-yyy format
                        var reverseDateString =
                            widget.absentsList[index]["date"].toString();
                        var reverseDateDateFormat =
                            DateFormat('yyyy-MM-dd').parse(reverseDateString);
                        var dateDateFormat = DateFormat('dd-MM-yyyy')
                            .format(reverseDateDateFormat);
                        var date = dateDateFormat.toString();
                        var day =
                            DateFormat('EEEE').format(reverseDateDateFormat);
                        return Padding(
                          padding: EdgeInsets.only(
                              left: kwidth! * 0.1,
                              right: kwidth! * 0.1,
                              top: 8.0,
                              bottom: (index == widget.absentsList.length - 1)
                                  ? 30.0
                                  : 0.0),
                          child: Container(
                            height: 80.0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: k3GreyColor, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "LEAVE",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: k3GreyColor),
                                        ),
                                        Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  VerticalDivider(
                                    thickness: 1.5,
                                    width: 0.0,
                                    indent: 5.0,
                                    endIndent: 5.0,
                                    color: k3GreyColor,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RichTextCard(
                                                  MdiIcons.clock, " FULL DAY"),
                                              const SizedBox(width: 10.0),
                                              RichTextCard(
                                                  FontAwesomeIcons.calendarDays,
                                                  " ${day.toUpperCase()}")
                                            ],
                                          ),
                                          Text(
                                            "DATE : $date",
                                            maxLines: 3,
                                            style: const TextStyle(fontSize: 15.0),
                                          ),
                                          Text(
                                            "REASON : - ",
                                            style: TextStyle(
                                                color: k3GreyColor,
                                                fontSize: 14.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ));
  }
}

Widget RichTextCard(IconData iconData, String text) {
  return Text.rich(
    TextSpan(
      style: TextStyle(fontSize: 13.0, color: k3GreyColor),
      children: [
        WidgetSpan(
          child: Icon(iconData, size: 17.0, color: k3GreyColor),
        ),
        TextSpan(text: text),
      ],
    ),
  );
}
