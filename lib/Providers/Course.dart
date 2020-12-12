import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CourseModel {
  String name;
  String creator;
  String source;
  String link;

  CourseModel({
    @required this.name,
    @required this.creator,
    @required this.source,
    @required this.link,
  });
}

class Course with ChangeNotifier {
  List<CourseModel> _courses = [];

  List<CourseModel> get courses {
    return [..._courses];
  }

  Future<void> getAndSetCourses() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/courses";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<CourseModel> loadedCourses = [];
      print(data);
      data.forEach((element) {
        loadedCourses.add(CourseModel(
          name: element["name"],
          creator: element["creator"],
          source: element["source"],
          link: element["link"],
        ));
      });
      _courses = loadedCourses;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }
}
