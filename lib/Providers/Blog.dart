import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BlogModel {
  String title;
  String author;
  String link;

  BlogModel({
    @required this.title,
    @required this.author,
    @required this.link,
  });
}

class Blog with ChangeNotifier {
  List<BlogModel> _blogs = [];

  List<BlogModel> get blogs {
    return [..._blogs];
  }

  Future<void> getAndSetBlogs() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/blogs";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<BlogModel> loadedBlogs = [];
      print(data);
      data.forEach((element) {
        loadedBlogs.add(BlogModel(
          title: element["title"],
          author: element["author"],
          link: element["link"],
        ));
      });
      _blogs = loadedBlogs;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }
}
