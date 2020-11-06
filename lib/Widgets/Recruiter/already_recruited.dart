import 'package:flutter/material.dart';

class AlreadyRecruited extends StatefulWidget {
  @override
  _AlreadyRecruitedState createState() => _AlreadyRecruitedState();
}

class _AlreadyRecruitedState extends State<AlreadyRecruited> {
  final _recruited = [
    {
      "company": "Google",
      "recruited": 4,
      "branches": ["CSE", "ISE"],
      "count": [2, 2],
    },
    {
      "company": "Microsoft",
      "recruited": 6,
      "branches": ["CSE", "ISE", "ECE"],
      "count": [3, 2, 1],
    },
    {
      "company": "Netflix",
      "recruited": 2,
      "branches": ["CSE", "ISE"],
      "count": [1, 1],
    },
    {
      "company": "Amazon",
      "recruited": 5,
      "branches": ["CSE", "ISE"],
      "count": [2, 3],
    }
  ];

  List<Widget> _foreachBranch(int i) {
    List branches = _recruited[i]['branches'];
    List count = _recruited[i]['count'];
    List<Widget> wids = branches.map((element) {
      int x = branches.indexOf(element);
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
        child: Text(
          "${branches[x]} : ${count[x]}",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }).toList();
    return wids;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: _recruited.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 0,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 40, color: Colors.green),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Text(
                    _recruited[i]["company"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Total recruited : ${_recruited[i]['recruited']}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Branches and respective count",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ..._foreachBranch(i),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
