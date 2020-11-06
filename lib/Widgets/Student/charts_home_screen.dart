import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartsForStudent extends StatefulWidget {
  @override
  _ChartsForStudentState createState() => _ChartsForStudentState();
}

class _ChartsForStudentState extends State<ChartsForStudent> {
  final _charts = [
    {
      "chartTitle": "Year Wise Placements",
      "primaryXaxis": CategoryAxis(
        interval: 2,
        axisLine: AxisLine(color: Colors.red),
        majorGridLines: MajorGridLines(width: 0),
        name: "Year",
        title: AxisTitle(
          text: "Year",
          textStyle: TextStyle(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      "primaryYaxis": NumericAxis(
        axisLine: AxisLine(color: Colors.red),
        majorGridLines: MajorGridLines(width: 0),
        name: "placement",
        title: AxisTitle(
          text: "Placements",
          textStyle: TextStyle(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      "series": <ChartSeries>[
        LineSeries<PlacementData, int>(
          dataSource: [
            PlacementData(2012, 50),
            PlacementData(2013, 60),
            PlacementData(2014, 30),
            PlacementData(2015, 40),
            PlacementData(2016, 50),
            PlacementData(2017, 70),
            PlacementData(2018, 80),
          ],
          name: "Placements",
          xValueMapper: (PlacementData data, _) => data.x,
          yValueMapper: (PlacementData data, _) => data.y,
          markerSettings: MarkerSettings(isVisible: true),
        ),
      ],
    },
    {
      "chartTitle": "Year Wise Placements",
      "primaryXaxis": CategoryAxis(
        interval: 2,
        axisLine: AxisLine(color: Colors.red),
        majorGridLines: MajorGridLines(width: 0),
        name: "Year",
        title: AxisTitle(
          text: "Year",
          textStyle: TextStyle(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      "primaryYaxis": NumericAxis(
        axisLine: AxisLine(color: Colors.red),
        majorGridLines: MajorGridLines(width: 0),
        name: "placement",
        title: AxisTitle(
          text: "Placements",
          textStyle: TextStyle(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      "series": <ChartSeries>[
        LineSeries<PlacementData, int>(
          dataSource: [
            PlacementData(2012, 50),
            PlacementData(2013, 60),
            PlacementData(2014, 30),
            PlacementData(2015, 40),
            PlacementData(2016, 50),
            PlacementData(2017, 70),
            PlacementData(2018, 80),
          ],
          name: "Placements",
          xValueMapper: (PlacementData data, _) => data.x,
          yValueMapper: (PlacementData data, _) => data.y,
          markerSettings: MarkerSettings(isVisible: true),
        ),
      ],
    },
    {
      "chartTitle": "Year Wise Placements",
      "primaryXaxis": CategoryAxis(
        interval: 2,
        axisLine: AxisLine(color: Colors.red),
        majorGridLines: MajorGridLines(width: 0),
        name: "Year",
        title: AxisTitle(
          text: "Year",
          textStyle: TextStyle(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      "primaryYaxis": NumericAxis(
        axisLine: AxisLine(color: Colors.red),
        majorGridLines: MajorGridLines(width: 0),
        name: "placement",
        title: AxisTitle(
          text: "Placements",
          textStyle: TextStyle(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      "series": <ChartSeries>[
        LineSeries<PlacementData, int>(
          dataSource: [
            PlacementData(2012, 50),
            PlacementData(2013, 60),
            PlacementData(2014, 30),
            PlacementData(2015, 40),
            PlacementData(2016, 50),
            PlacementData(2017, 70),
            PlacementData(2018, 80),
          ],
          name: "Placements",
          xValueMapper: (PlacementData data, _) => data.x,
          yValueMapper: (PlacementData data, _) => data.y,
          markerSettings: MarkerSettings(isVisible: true),
        ),
      ],
    },
    {
      "chartTitle": "Year Wise Placements",
      "primaryXaxis": CategoryAxis(
        interval: 2,
        axisLine: AxisLine(color: Colors.red),
        majorGridLines: MajorGridLines(width: 0),
        name: "Year",
        title: AxisTitle(
          text: "Year",
          textStyle: TextStyle(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      "primaryYaxis": NumericAxis(
        axisLine: AxisLine(color: Colors.red),
        majorGridLines: MajorGridLines(width: 0),
        name: "placement",
        title: AxisTitle(
          text: "Placements",
          textStyle: TextStyle(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      "series": <ChartSeries>[
        LineSeries<PlacementData, int>(
          dataSource: [
            PlacementData(2012, 50),
            PlacementData(2013, 60),
            PlacementData(2014, 30),
            PlacementData(2015, 40),
            PlacementData(2016, 50),
            PlacementData(2017, 70),
            PlacementData(2018, 80),
          ],
          name: "Placements",
          xValueMapper: (PlacementData data, _) => data.x,
          yValueMapper: (PlacementData data, _) => data.y,
          markerSettings: MarkerSettings(isVisible: true),
        ),
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _charts.length,
        itemBuilder: (ctx, i) => Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 40, color: Colors.blue[300])],
          ),
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                backgroundColor: Colors.black54,
                borderWidth: 0,
                enableAxisAnimation: true,
                title: ChartTitle(
                  text: _charts[i]["chartTitle"],
                  textStyle: TextStyle(color: Colors.white),
                ),
                primaryXAxis: _charts[i]["primaryXaxis"],
                primaryYAxis: _charts[i]["primaryYaxis"],
                tooltipBehavior: TooltipBehavior(enable: true),
                series: _charts[i]["series"],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlacementData {
  int x;
  int y;

  PlacementData(this.x, this.y);
}
