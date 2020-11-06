import 'package:flutter/material.dart';
import 'package:placement_stats/Widgets/Student/charts_home_screen.dart';
import 'package:placement_stats/Widgets/Student/experiences_list.dart';
import 'package:placement_stats/Widgets/Student/student_appDrawer.dart';

class HomeScreenStudent extends StatefulWidget {
  static const String routeName = "/student-home";
  @override
  _HomeScreenStudentState createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final _swipeLeft = Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text("Swipe left to see more!"),
      Icon(
        Icons.keyboard_arrow_right,
        size: 40,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: StudentDrawer(),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Text(
                  "Experiences",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                child: Text(
                  "Experiences of people you might know!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ExperiencesList(),
              _swipeLeft,
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                      child: Text(
                        "Some Stats!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      child: Text(
                        "Few visualizations of placement data!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ChartsForStudent(),
                    _swipeLeft,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
