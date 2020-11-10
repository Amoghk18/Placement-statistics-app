import 'package:flutter/material.dart';
import 'package:placement_stats/Screens/DetailScreens/chart_detail_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartsForStudent extends StatefulWidget {
  @override
  _ChartsForStudentState createState() => _ChartsForStudentState();
}

class _ChartsForStudentState extends State<ChartsForStudent> {
  final _charts = [
    {
      "chartTitle": "Year Wise Placements",
      "XaxisType": "category",
      "YaxisType": "numeric",
      "XaxisInterval": 2,
      "YaxisInterval": 0,
      "XaxisName": "Year",
      "YaxisName": "Placement",
      "seriesType": "chartseries",
      "chartType": "lineseries",
      "seriesName": "Placements",
      "chartDesc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "dataSource": {
        2012: 50,
        2013: 60,
        2014: 30,
        2015: 40,
        2016: 50,
        2017: 70,
        2018: 80,
      },
    },
    {
      "chartTitle": "Branch Wise Placements",
      "XaxisType": "category",
      "YaxisType": "numeric",
      "XaxisInterval": 2,
      "YaxisInterval": 0,
      "XaxisName": "Year",
      "YaxisName": "Placement",
      "seriesType": "chartseries",
      "chartType": "lineseries",
      "seriesName": "Placements",
      "chartDesc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "dataSource": {
        2012: 50,
        2013: 60,
        2014: 30,
        2015: 40,
        2016: 50,
        2017: 70,
        2018: 80,
      },
    },
    {
      "chartTitle": "Domain Wise Placements",
      "XaxisType": "category",
      "YaxisType": "numeric",
      "XaxisInterval": 2,
      "YaxisInterval": 0,
      "XaxisName": "Year",
      "YaxisName": "Placement",
      "seriesType": "chartseries",
      "chartType": "lineseries",
      "seriesName": "Placements",
      "chartDesc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "dataSource": {
        2012: 50,
        2013: 60,
        2014: 30,
        2015: 40,
        2016: 50,
        2017: 70,
        2018: 80,
      },
    },
    {
      "chartTitle": "Skill Level Wise Placements",
      "XaxisType": "category",
      "YaxisType": "numeric",
      "XaxisInterval": 2,
      "YaxisInterval": 0,
      "XaxisName": "Year",
      "YaxisName": "Placement",
      "seriesType": "chartseries",
      "chartType": "lineseries",
      "seriesName": "Placements",
      "chartDesc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "dataSource": {
        2012: 50,
        2013: 60,
        2014: 30,
        2015: 40,
        2016: 50,
        2017: 70,
        2018: 80,
      },
    },
  ];

  void _pushToDetailScreen(int i) {
    Navigator.of(context).pushNamed(
      ChartDetailScreen.routeName,
      arguments: {"data": _charts[i]},
    );
  }

  List<PlacementData> _convertData(int i) {
    final data = _charts[i]["dataSource"] as Map<dynamic, dynamic>;
    List<PlacementData> plData = [];
    data.forEach((key, value) {
      plData.add(PlacementData(key, value));
    });
    return plData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _charts.length,
        itemBuilder: (ctx, i) => Hero(
          tag: _charts[i]["chartTitle"],
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 40, color: Colors.blue[300]),
              ],
            ),
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () => _pushToDetailScreen(i),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    children: [
                      SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        backgroundColor: Colors.black54,
                        borderWidth: 0,
                        enableAxisAnimation: true,
                        title: ChartTitle(
                          text: _charts[i]["chartTitle"],
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        primaryXAxis: CategoryAxis(
                          interval: 2,
                          axisLine: AxisLine(color: Colors.red),
                          majorGridLines: MajorGridLines(width: 0),
                          name: _charts[i]["XaxisName"],
                          title: AxisTitle(
                            text: _charts[i]["XaxisName"],
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        primaryYAxis: NumericAxis(
                          axisLine: AxisLine(color: Colors.red),
                          majorGridLines: MajorGridLines(width: 0),
                          name: _charts[i]["YaxisName"],
                          title: AxisTitle(
                            text: _charts[i]["YaxisName"],
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries>[
                          LineSeries<PlacementData, int>(
                            dataSource: _convertData(i),
                            name: _charts[i]["seriesName"],
                            xValueMapper: (PlacementData data, _) => data.x,
                            yValueMapper: (PlacementData data, _) => data.y,
                            markerSettings: MarkerSettings(isVisible: true),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Colors.black54,
                          alignment: Alignment.center,
                          child: Text(
                            "Click here to see more!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
