import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:placement_stats/Providers/Chart.dart';
import 'package:placement_stats/Screens/DetailScreens/student/chart_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartsForStudent extends StatefulWidget {
  @override
  _ChartsForStudentState createState() => _ChartsForStudentState();
}

class _ChartsForStudentState extends State<ChartsForStudent> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<Chart>(context, listen: false).getAndSetCharts().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _pushToDetailScreen(int i, ChartModel chart) {
    Navigator.of(context).pushNamed(
      ChartDetailScreen.routeName,
      arguments: {"data": chart},
    );
  }

  List<PlacementData> _convertData(int i, Map<int, int> m) {
    List<PlacementData> plData = [];
    m.forEach((key, value) {
      plData.add(PlacementData(key, value));
    });
    return plData;
  }

  @override
  Widget build(BuildContext context) {
    final _charts = Provider.of<Chart>(context).charts;
    return _isLoading
        ? Container(
            height: MediaQuery.of(context).size.height * 0.43,
            padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
            child: Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(
                    "assets/images/loading-worms-json.json",
                    animate: true,
                    repeat: true,
                  ),
                ),
              ),
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.43,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _charts.length,
              itemBuilder: (ctx, i) => Hero(
                tag: _charts[i].chartTitle,
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
                      onTap: () => _pushToDetailScreen(i, _charts[i]),
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
                                text: _charts[i].chartTitle,
                                textStyle: TextStyle(color: Colors.white),
                              ),
                              primaryXAxis: CategoryAxis(
                                interval: 2,
                                axisLine: AxisLine(color: Colors.red),
                                majorGridLines: MajorGridLines(width: 0),
                                name: _charts[i].xaxisName,
                                title: AxisTitle(
                                  text: _charts[i].xaxisName,
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              primaryYAxis: NumericAxis(
                                axisLine: AxisLine(color: Colors.red),
                                majorGridLines: MajorGridLines(width: 0),
                                name: _charts[i].yaxisName,
                                title: AxisTitle(
                                  text: _charts[i].yaxisName,
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <ChartSeries>[
                                LineSeries<PlacementData, int>(
                                  dataSource:
                                      _convertData(i, _charts[i].dataSource),
                                  name: _charts[i].seriesName,
                                  xValueMapper: (PlacementData data, _) =>
                                      data.x,
                                  yValueMapper: (PlacementData data, _) =>
                                      data.y,
                                  markerSettings:
                                      MarkerSettings(isVisible: true),
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
