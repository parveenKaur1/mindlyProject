/*
* NAME OF CODE ARTIFACT - graph_page.dart
* BRIEF DESCRIPTION - This creates the frontend for the sample graph
* PROGRAMMERS NAME - Parveen Kaur
* DATE CODE CREATED - January 28th 2023
* DATE REVISED - 
* KNOWN FAULTS - hardcoded for now
*/

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyGraph extends StatefulWidget {
  //class for the login landing page.
  const MyGraph({Key? key}) : super(key: key); // constructor for log in page.

  @override
  _MyGraphState createState() => _MyGraphState(); //creates login page.
}

class _MyGraphState extends State<MyGraph> {
  List<MoodMeter> data = [
    MoodMeter('Day 1', 98), // Day1 value
    MoodMeter('Day 2', 85), // Day1 value
    MoodMeter('Day 3', 72), // Day1 value
    MoodMeter('Day 4', 80), // Day2 value
    MoodMeter('Day 5', 30), // Day 3 value
    MoodMeter('Day 6', 35), // Day 4 value
    MoodMeter('Day 7', 35), // Day 5 value
    MoodMeter('Day 8', 35), // Day 6 value
    MoodMeter('Day 9', 50), // Day 7 value
    MoodMeter('Day 10', 35), // Day 8 value
    MoodMeter('Day 11', 75), // Day value
    MoodMeter('Day 12', 83), // Day value
    MoodMeter('Day 13', 78), // Day value
    MoodMeter('Day 14', 80), // Day value
    MoodMeter('Day 15', 80), // Day value
    MoodMeter('Day 16', 80), // Day value
    MoodMeter('Day 17', 80), // Day value
    MoodMeter('Day 18', 80), // Day value
    MoodMeter('Day 19', 90), // Day value
    MoodMeter('Day 20', 90), // Day value
    MoodMeter('Day 21', 90), // Day value
    MoodMeter('Day 22', 75), // Day value
    MoodMeter('Day 23', 20), // Day value
    MoodMeter('Day 24', 78), // Day value
    MoodMeter('Day 25', 87), // Day value
    MoodMeter('Day 26', 87), // Day value
    MoodMeter('Day 27', 53), // Day value
    MoodMeter('Day 28', 65), // Day value
    MoodMeter('Day 29', 23), // Day value
    MoodMeter('Day 30', 28), // Day value
    MoodMeter('Day 31', 34), // Day value
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monthly Summary"), // header of page
        centerTitle: true, // page aesthetic
        backgroundColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      body: Container(
          // body of page
          child: SfCartesianChart(
              // type of graph
              primaryXAxis: CategoryAxis(), // xaxis
              title: ChartTitle(text: 'Your Mood Meter'), // chart title
              legend: Legend(
                isVisible: true,
              ), // visibility of line
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<MoodMeter, String>>[
            LineSeries<MoodMeter, String>(
              // line graph
              dataSource: data,
              xValueMapper: (MoodMeter mood, _) =>
                  mood.week, // x represents week
              yValueMapper: (MoodMeter mood, _) =>
                  mood.mood, // y represents mood
              name: 'happiness percentage', // name of line
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ])),
    );
  }
}

class MoodMeter {
  final String week; // member vars

  final double mood; //member vars

  MoodMeter(this.week, this.mood); // constructor
}
