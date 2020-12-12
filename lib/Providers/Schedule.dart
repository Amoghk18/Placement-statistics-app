import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ScheduleModel {
  String name;
  String datetime;
  String agenda;
  String link;
  bool isExpanded;

  ScheduleModel({
    @required this.name,
    @required this.datetime,
    @required this.agenda,
    @required this.link,
    @required this.isExpanded,
  });
}

class Schedule with ChangeNotifier {
  List<ScheduleModel> _schedules = [];

  List<ScheduleModel> get schedules {
    return [..._schedules];
  }

  Future<void> getandsetSchedules() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/schedules";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<ScheduleModel> loadedSchedules = [];
      print(data);
      data.forEach((element) {
        loadedSchedules.add(ScheduleModel(
            name: element["name"],
            agenda: element["agenda"],
            datetime: element["datetime"],
            link: element["link"],
            isExpanded: element["isExpanded"]));
      });
      _schedules = loadedSchedules;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }

  Future<void> createSchedule(Map<String, String> m) async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/schedules";
    try {
      final response = await http.post(url,
          body: json.encode({
            "name": m["name"],
            "datetime": m["datetime"],
            "agenda": m["agenda"],
            "link": m["link"]
          }),
          headers: {"Content-Type": "application/json"});
      final respData = json.decode(response.body);
      print(respData);
      _schedules.add(
        ScheduleModel(
          name: m["name"],
          datetime: m["dateTime"],
          agenda: m["agenda"],
          link: m["link"],
          isExpanded: false,
        ),
      );
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
