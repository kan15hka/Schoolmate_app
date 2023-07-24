import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/subjects/components/performance_graph.dart';

class CTAnalysis extends StatefulWidget {
  const CTAnalysis({super.key});

  @override
  State<CTAnalysis> createState() => _CTAnalysisState();
}

class _CTAnalysisState extends State<CTAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 50.0,
            width: width! * 0.88,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Text(
                  'Average Percentage: ',
                  textScaleFactor: 1.0,
                  style: kBodyBoldTextStyle,
                ),
                Spacer(),
                Text(
                  '94%',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: kSFUIText,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  'Mathematics Cycle Test this year:',
                  textScaleFactor: 1.0,
                  style: kBodyBoldTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          //GRAPH
          PerformanceGraph(),
          SizedBox(
            height: 25.0,
          ),

          SizedBox(height: 50.0)
        ]),
      ),
    );
  }
}
