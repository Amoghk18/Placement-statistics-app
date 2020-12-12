import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LinkModel {
  String name;
  String creator;
  String link;

  LinkModel({
    @required this.name,
    @required this.creator,
    @required this.link,
  });
}

class Link with ChangeNotifier {
  List<LinkModel> _links = [];

  List<LinkModel> get links {
    return [..._links];
  }

  Future<void> getAndSetLinks() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/links";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<LinkModel> loadedLinks = [];
      print(data);
      data.forEach((element) {
        loadedLinks.add(LinkModel(
          name: element["name"],
          creator: element["creator"],
          link: element["link"],
        ));
      });
      _links = loadedLinks;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }
}
