import 'package:flutter/material.dart';
import 'package:placement_stats/Widgets/Student/charts_home_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartDetailScreen extends StatelessWidget {
  List<PlacementData> _convertData(Map<dynamic, dynamic> chartData) {
    List<PlacementData> plData = [];
    chartData.forEach((key, value) {
      plData.add(PlacementData(key, value));
    });
    return plData;
  }

  static const String routeName = '/chart-detail';
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final chart = data["data"];
    return Hero(
      tag: chart["chartTitle"],
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Text(
                  chart["chartTitle"],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      backgroundColor: Colors.black45,
                      borderWidth: 0,
                      enableAxisAnimation: true,
                      title: ChartTitle(
                        text: chart["chartTitle"],
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      primaryXAxis: CategoryAxis(
                        interval: 2,
                        axisLine: AxisLine(color: Colors.red),
                        majorGridLines: MajorGridLines(width: 0),
                        name: chart["XaxisName"],
                        title: AxisTitle(
                          text: chart["XaxisName"],
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      primaryYAxis: NumericAxis(
                        axisLine: AxisLine(color: Colors.red),
                        majorGridLines: MajorGridLines(width: 0),
                        name: chart["YaxisName"],
                        title: AxisTitle(
                          text: chart["YaxisName"],
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        LineSeries<PlacementData, int>(
                          dataSource: _convertData(chart["dataSource"]),
                          name: chart["seriesName"],
                          xValueMapper: (PlacementData data, _) => data.x,
                          yValueMapper: (PlacementData data, _) => data.y,
                          markerSettings: MarkerSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 2),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Brief description",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          chart["chartDesc"],
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          chart["chartDesc"],
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
