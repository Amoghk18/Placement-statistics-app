import 'package:flutter/material.dart';
import 'package:placement_stats/Widgets/Student/student_appDrawer.dart';

class CompanyName extends StatefulWidget {
  static const String routeName = "/stats";
  @override
  _CompanyDetail createState() => _CompanyDetail();
}

class _CompanyDetail extends State<CompanyName> {
  final _arr = [
    {
      "company": "google",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
    {
      "company": "Nutanix",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
    {
      "company": "Adobe",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
    {
      "company": "Amazon",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
    {
      "company": "netflix",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
    {
      "company": "TCS",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
    {
      "company": "HoneyWell",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
    {
      "company": "Ardroc",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
    {
      "company": "Fidelity",
      "years": ["2009", "2010"],
      "selected": "-"
    },
    {
      "company": "facebook",
      "years": ["2001", "2002", "2003"],
      "selected": "-"
    },
  ];

  List<DropdownMenuItem<String>> loadData(int i) {
    List<String> year = _arr[i]["years"];
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

  @override
  Widget build(BuildContext context) {
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
                  "SN",
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _arr.length,
                  itemBuilder: (ctx, i) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selected = i;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      child: Text(
                                        _arr[i]["company"],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                    _selected == i
                                        ? Positioned(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.blue,
                                                size: 25,
                                              ),
                                            ),
                                            right: 0,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: DropdownButton<String>(
                                key: Key(_arr[i]["company"]),
                                iconEnabledColor: Colors.white,
                                //value: _arr[i]["selected"],
                                hint: Text(
                                  "Year",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    _arr[i]["selected"] = newValue;
                                  });
                                  print(_arr[i]["selected"]);
                                },
                                items: loadData(i),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                print(_arr[i]["company"].toString() +  " : " + _arr[i]["selected"]);
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
                          "Selected : ${_arr[i]['selected']}",
                          style: TextStyle(color: Colors.white),
                        )
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
