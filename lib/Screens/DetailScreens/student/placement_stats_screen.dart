import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:placement_stats/Providers/Auth.dart';
import 'package:placement_stats/Providers/CompanyYear.dart';
import 'package:placement_stats/Screens/DetailScreens/student/Hiring_process_screen.dart';
import 'package:placement_stats/Widgets/Student/student_appDrawer.dart';
import 'package:provider/provider.dart';

class CompanyName extends StatefulWidget {
  static const String routeName = "/stats";
  @override
  _CompanyDetail createState() => _CompanyDetail();
}

class _CompanyDetail extends State<CompanyName> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<CompanyYear>(context, listen: false)
        .getandsetCompanyYears()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _getAbbrName(String name) {
    final arr = name.split(" ");
    var str = "";
    arr.forEach((e) => str += e[0]);
    return str;
  }

  List<DropdownMenuItem<String>> loadData(int i, CompanyYearModel cy) {
    List<dynamic> ys = cy.years;
    List<String> year = [];
    ys.forEach((element) {
      year.add("$element");
    });
    List<DropdownMenuItem<String>> yearList = year
        .map(
          (e) => DropdownMenuItem<String>(
            child: Text(e.toString()),
            value: e,
          ),
        )
        .toList();

    return yearList;
  }

  var _selected = 0;

  void _go(String company, String year) {
    Navigator.of(context).pushNamed(
      CompanyDescription.routeName,
      arguments: {
        "company": company,
        "year": year,
      },
    );
  }

  void showerror() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "No year selected",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text("Please select a year to continue"),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _cyears =
        Provider.of<CompanyYear>(context, listen: false).companyYears;
    final data = Provider.of<Auth>(context).student;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: StudentDrawer(1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Placement Stats",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.8,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange[300],
              child: FittedBox(
                child: Text(
                  _getAbbrName(data.name),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Text(
                "Stats company wise",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text(
                "Check out what procedures were followed in which year company wise!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Lottie.asset(
                              "assets/images/loading-worms-json.json",
                              animate: true,
                              repeat: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _cyears.length,
                        itemBuilder: (ctx, i) => Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        _cyears[i].company,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: DropdownButton<String>(
                                      key: Key(_cyears[i].company),
                                      iconEnabledColor: Colors.white,
                                      hint: Text(
                                        "Year",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _cyears[i].selected = newValue;
                                        });
                                        print(_cyears[i].selected);
                                      },
                                      items: loadData(i, _cyears[i]),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      if (_cyears[i].selected == "-") {
                                        showerror();
                                      } else
                                        _go(_cyears[i].company,
                                            _cyears[i].selected);
                                    },
                                    color: Colors.black,
                                    elevation: 0,
                                    child: Text(
                                      "GO",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Selected : ${_cyears[i].selected}",
                                style: TextStyle(color: Colors.white),
                              ),
                              if (_cyears.length < 7 && i == _cyears.length - 1)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 40, 0, 10),
                                  child: Text(
                                    "That's it for now!",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
