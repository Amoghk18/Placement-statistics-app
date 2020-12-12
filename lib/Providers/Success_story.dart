import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SuccessModel {
  String name;
  String college;
  String contact;
  String company;
  String package;
  bool haveCopied;

  SuccessModel({
    @required this.name,
    @required this.college,
    @required this.contact,
    @required this.company,
    @required this.package,
    @required this.haveCopied,
  });
}

class SuccessStory with ChangeNotifier {
  List<SuccessModel> _successStories = [];

  List<SuccessModel> get stories {
    return [..._successStories];
  }

  Future<void> getAndSetSuccessStories() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/successstories";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<SuccessModel> loadedSS = [];
      print(data);
      data.forEach((element) {
        loadedSS.add(SuccessModel(
          name: element["name"],
          college: element["college"],
          company: element["company"],
          contact: element["contact"],
          package: element["package"],
          haveCopied: element["haveCopied"]
        ));
      });
      _successStories = loadedSS;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }
}
