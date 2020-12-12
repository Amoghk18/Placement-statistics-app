import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CompanyYearModel {
  String company;
  String selected;
  List<dynamic> years;

  CompanyYearModel({
    @required this.company,
    @required this.selected,
    @required this.years,
  });
}

class CompanyYear with ChangeNotifier{

  List<CompanyYearModel> _companyYears = [];

  List<CompanyYearModel> get companyYears{
    return [..._companyYears];
  }

  Future<void> getandsetCompanyYears() async {
    final url = "https://placement-stats-test.herokuapp.com/api/v1/companyyear";
    try {
      final response = await http.get(url);
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      List<CompanyYearModel> loadedCompanyYears = [];
      print(data);
      data.forEach((element) {
        loadedCompanyYears.add(CompanyYearModel(
          company: element["company"],
          selected: element["selected"],
          years: element["years"]
        ));
      });
      _companyYears = loadedCompanyYears;
      notifyListeners();
      print("Done");
    } catch (err) {
      print(err);
    }
  }

}