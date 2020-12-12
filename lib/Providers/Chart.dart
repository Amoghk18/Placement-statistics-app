import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ChartModel {
  String chartTitle;
  String xaxisType;
  String yaxisType;
  String xaxisInterval;
  String yaxisInterval;
  String xaxisName;
  String yaxisName;
  String seriesType;
  String chartType;
  String seriesName;
  String chartDesc;
  Map<int, int> dataSource;

  ChartModel(
      {@required this.chartTitle,
      @required this.xaxisType,
      @required this.yaxisType,
      @required this.xaxisInterval,
      @required this.yaxisInterval,
      @required this.xaxisName,
      @required this.yaxisName,
      @required this.seriesType,
      @required this.seriesName,
      @required this.chartType,
      @required this.chartDesc,
      @required this.dataSource});
}

class Chart with ChangeNotifier {
  List<ChartModel> _charts = [];

  List<ChartModel> get charts {
    return [..._charts];
  }

  Map<int, int> dataSource(Map<String, dynamic> m){
    Map<int, int> data = {};
    m.forEach((key, value) {
      data[int.parse(key)] = value;
    });
    return data;
  }

  Future<void> getAndSetCharts() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/charts";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<ChartModel> loadedCharts = [];
      print(data);
      data.forEach((element) {
        loadedCharts.add(ChartModel(
          chartTitle: element["chartTitle"],
          xaxisType: element["xaxisType"],
          yaxisType: element["yaxisType"],
          xaxisInterval: element["xaxisInterval"],
          yaxisInterval: element["yaxisInterval"],
          xaxisName: element["xaxisName"],
          yaxisName: element["yaxisName"],
          seriesType: element["seriesType"],
          seriesName: element["seriesName"],
          chartType: element["seriesName"],
          chartDesc: element["chartDesc"],
          dataSource: dataSource(element["dataSource"]),
        ));
      });
      _charts = loadedCharts;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }
}
