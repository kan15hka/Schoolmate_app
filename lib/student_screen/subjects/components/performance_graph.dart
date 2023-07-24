import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:schoolmate/constants.dart';

class PerformanceGraph extends StatelessWidget {
  const PerformanceGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 20.0),
      height: height! * 0.35,
      child: LineChart(LineChartData(
          clipData: FlClipData.horizontal(),
          minX: 0,
          maxX: 3,
          minY: 0,
          maxY: 19,
          titlesData: titlesData,
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                  color: Color.fromARGB(255, 235, 231, 231), strokeWidth: 1.5);
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                  color: Color.fromARGB(255, 235, 231, 231), strokeWidth: 1.5);
            },
          ),
          borderData: FlBorderData(
              show: true, border: Border.all(color: kLightGrey, width: 1.5)),
          lineBarsData: [
            LineChartBarData(
                isCurved: true,
                color: Color.fromARGB(255, 130, 41, 211),
                barWidth: 3.0,
                // dotData: FlDotData(show: false),
                spots: [
                  FlSpot(0, 2),
                  FlSpot(1, 15),
                  FlSpot(2, 6),
                  FlSpot(3, 10),
                  FlSpot(4, 19),
                ],
                belowBarData: BarAreaData(
                    show: true, color: Color.fromARGB(20, 130, 41, 211)))
          ])),
    );
  }
}

FlTitlesData get titlesData => FlTitlesData(
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    bottomTitles: AxisTitles(
        sideTitles: bottomTitles(),
        axisNameWidget: Text(
          'Test Conducted this year',
          textScaleFactor: 1.0,
          style: kBodyLightTextStyle,
        )),
    leftTitles: AxisTitles(
        sideTitles: leftTitles(),
        axisNameWidget: Text(
          '                  Total Marks',
          textScaleFactor: 1.0,
          style: kBodyLightTextStyle,
        )));

SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitlesWidget,
    showTitles: true,
    interval: 1,
    reservedSize: 40.0);

Widget leftTitlesWidget(double value, TitleMeta meta) {
  var style =
      TextStyle(fontSize: 15.0, fontFamily: kSFUIText, color: Colors.black);
  Widget text;
  switch (value.toInt()) {
    case 5:
      text = Text(
        '25',
        style: style,
        textScaleFactor: 1.0,
      );
      break;
    case 10:
      text = Text('50', textScaleFactor: 1.0, style: style);
      break;
    case 15:
      text = Text('75', textScaleFactor: 1.0, style: style);
      break;
    case 19:
      text = Text('100', textScaleFactor: 1.0, style: style);
      break;
    default:
      return Text('', style: style);
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

Widget bottomTitlesWidget(double value, TitleMeta meta) {
  var style =
      TextStyle(fontSize: 15.0, fontFamily: kSFUIText, color: Colors.black);
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'T1';
      break;
    case 1:
      text = 'T2';
      break;
    case 2:
      text = 'T3';
      break;
    case 3:
      text = 'T4';
      break;
    default:
      return Container();
  }
  return Text(
    text,
    style: style,
    textAlign: TextAlign.center,
    textScaleFactor: 1.0,
  );
}

SideTitles bottomTitles() => SideTitles(
    getTitlesWidget: bottomTitlesWidget,
    showTitles: true,
    interval: 1,
    reservedSize: 40.0);
