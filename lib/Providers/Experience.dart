import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ExperienceModel {
  String name;
  String college;
  String companyName;
  String exp;
  String interviewProcess;
  String suggestions;
  String position;
  int ctc;

  ExperienceModel({
    @required this.name,
    @required this.college,
    @required this.companyName,
    @required this.exp,
    @required this.interviewProcess,
    this.suggestions,
    @required this.ctc,
    @required this.position,
  });
}

class Experience with ChangeNotifier {
  List<ExperienceModel> _exps = [];

  List<ExperienceModel> get experiences {
    return [..._exps];
  }

  Future<void> getAndSetExps() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/experiences";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<ExperienceModel> loadedExps = [];
      print(data);
      data.forEach((element) {
        loadedExps.add(ExperienceModel(
          name: element["name"],
          college: "BMS College of Engineering",
          companyName: element["companyName"],
          exp: element["experience"],
          interviewProcess: element["interviewProcess"],
          ctc: element["ctc"],
          position: element["position"],
        ));
      });
      _exps = loadedExps;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }

  Future<void> shareExp(Map<String, dynamic> exp) async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/experiences";
    final response = await http.post(
      url,
      body: json.encode({
        'name': exp["name"],
        'companyName': exp["company"],
        'experience': exp["experience"],
        'ctc': int.parse(exp["income"]),
        'interviewProcess': exp["interview"],
        'suggestions': exp["suggestions"],
        'position': exp["position"]
      }),
      headers: {
        "Content-Type": "application/json"
      },
    );
    final respData = json.decode(response.body);
    print(respData);
    final newExp = ExperienceModel(
      name: exp["name"],
      college: "BMS College Of Engineering",
      companyName: exp["company"],
      ctc: int.parse(exp["income"]),
      exp: exp["experience"],
      interviewProcess: exp["interview"],
      position: exp["position"],
      suggestions: exp["suggestions"],
    );
    _exps.add(newExp);
    notifyListeners();
  }
}
