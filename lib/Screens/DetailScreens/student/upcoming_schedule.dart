import 'package:flutter/material.dart';
import 'package:placement_stats/Widgets/Student/build_schedule.dart';
import 'package:placement_stats/Widgets/Student/student_appDrawer.dart';

class UpcomingScheduleScreen extends StatelessWidget {
  static const String routeName = "/upcoming-schedule";

  final _skinColor = Color(0xffffe9e3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: StudentDrawer(4),
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
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Text(
                "Upcoming Schedule",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text(
                "Events, Webinars, Pre-pacement talks!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: _skinColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ScheduleBuilder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
