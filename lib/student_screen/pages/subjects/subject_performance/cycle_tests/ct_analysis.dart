import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/pages/subjects/components/performance_graph.dart';

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
          const SizedBox(
            height: 25.0,
          ),
          Container(
            height: 50.0,
            width: kwidth! * 0.88,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: k3GreyColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Text(
                  'Average Percentage: ',
                  textScaleFactor: 1.0,
                  style: kBodyBoldTextStyle,
                ),
                const Spacer(),
                const Text(
                  '94%',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
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
          const SizedBox(
            height: 25.0,
          ),
          //GRAPH
          const PerformanceGraph(),
          const SizedBox(
            height: 25.0,
          ),

          const SizedBox(height: 50.0)
        ]),
      ),
    );
  }
}
