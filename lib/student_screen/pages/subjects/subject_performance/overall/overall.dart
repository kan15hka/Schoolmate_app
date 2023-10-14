import 'package:flutter/material.dart';
import 'package:schoolmate/constants.dart';
import 'package:schoolmate/student_screen/pages/subjects/components/performance_graph.dart';

class OverallPerformance extends StatefulWidget {
  const OverallPerformance({super.key});

  @override
  State<OverallPerformance> createState() => _OverallPerformanceState();
}

class _OverallPerformanceState extends State<OverallPerformance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
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
                  'Mathematics this year:',
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
          //TEACHER
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: 80.0,
                width: kwidth! * 0.88,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: k3GreyColor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('assets/leo.jpg')),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Mr. Teacher Name',
                      textScaleFactor: 1.0,
                      style: kBodyBoldTextStyle,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Mathematics Teacher',
                  textScaleFactor: 1.0,
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50.0)
        ]),
      ),
    );
  }
}
