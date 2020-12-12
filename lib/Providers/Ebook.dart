import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class EbookModel {
  String name;
  String author;
  String link;

  EbookModel({
    @required this.name,
    @required this.author,
    @required this.link,
  });
}

class Ebook with ChangeNotifier {
  List<EbookModel> _ebooks = [];

  List<EbookModel> get ebooks {
    return [..._ebooks];
  }

  Future<void> getAndSetEbooks() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/ebooks";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<EbookModel> loadedEbooks = [];
      print(data);
      data.forEach((element) {
        loadedEbooks.add(EbookModel(
          name: element["name"],
          author: element["author"],
          link: element["link"],
        ));
      });
      _ebooks = loadedEbooks;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }
}
