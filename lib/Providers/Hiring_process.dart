import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HiringProcessModel {
  String name;
  String year;
  String jd;
  String eligibilityCriteria;
  String duration;
  String location;
  String stipendOrCtc;
  String process;
  String rounds;

  HiringProcessModel({
    @required this.name,
    @required this.year,
    @required this.jd,
    @required this.eligibilityCriteria,
    @required this.duration,
    @required this.location,
    @required this.stipendOrCtc,
    @required this.process,
    @required this.rounds,
  });
}

class HiringProcess with ChangeNotifier {
  HiringProcessModel _process;

  HiringProcessModel get process {
    return _process;
  }

  Future<void> getAndSetProcess(String companyName, String year) async {
    final url =
        "https://placement-stats-test.herokuapp.com/api/v1/process/$companyName/$year";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      print(data);
      final p = HiringProcessModel(
          name: data["name"],
          duration: data["duration"],
          eligibilityCriteria: data["eligibilityCriteria"],
          jd: data["jd"],
          location: data["location"],
          process: data["process"],
          rounds: data["rounds"],
          stipendOrCtc: data["stipendOrCtc"],
          year: data["year"]);
      _process = p;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }

  Future<void> createProcess(Map<String, String> m) async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/process";
    try {
      final response = await http.post(url,
          body: json.encode({
            "name": m["name"],
            "year": m["year"],
            "jd": m["jd"],
            "eligibilityCriteria": m["eligibilityCriteria"],
            "stipendOrCtc": m["stipendOrCtc"],
            "process": m["process"],
            "rounds": m["rounds"],
            "duration": m["duration"],
            "location": m["location"],
          }),
          headers: {"Content-Type": "application/json"});
      final extractedBody = json.decode(response.body);
      final data = extractedBody["data"];
      print(data);
      print("Done");
    } catch (err) {
      print(err);
    }
  }
}
