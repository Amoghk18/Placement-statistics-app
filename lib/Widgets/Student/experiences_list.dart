import 'package:flutter/material.dart';
import 'package:placement_stats/Screens/DetailScreens/student/experience_detail.dart';

class ExperiencesList extends StatefulWidget {
  @override
  _ExperiencesListState createState() => _ExperiencesListState();
}

class _ExperiencesListState extends State<ExperiencesList> {
  final _exp = [
    {
      "name": "Abcde uvwxyz",
      "college": "BMS College of Engineering",
      "work": "Junior Developer at Google",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    },
    {
      "name": "Abcde uvwxyz",
      "college": "BMS College of Engineering",
      "work": "Data Analyst at Microsoft",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    },
    {
      "name": "Abcde uvwxyz",
      "college": "BMS College of Engineering",
      "work": "Android Developer at Amazon",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "name": "Abcde uvwxyz",
      "college": "BMS College of Engineering",
      "work": "Machine Learning Engineer at Netflix",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    },
  ];

  void _pushToDetailScreen(int i) {
    Navigator.of(context).pushNamed(
      ExperienceDetailScreen.routeName,
      arguments: {"data": _exp[i]},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _exp.length,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.all(16),
          child: Hero(
            tag: _exp[i]["work"],
            child: Card(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                splashColor: Colors.orange,
                onTap: () => _pushToDetailScreen(i),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.red, blurRadius: 40),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _exp[i]["name"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _exp[i]["work"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        _exp[i]["college"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                        endIndent: 15,
                        height: 30,
                      ),
                      Text(
                        "Let's see what they have to say...",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '"${_exp[i]['desc']}"',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Click to see more!",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
