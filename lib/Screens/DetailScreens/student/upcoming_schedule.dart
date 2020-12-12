import 'package:flutter/material.dart';
import 'package:placement_stats/Providers/Schedule.dart';
import 'package:placement_stats/Widgets/Student/build_schedule.dart';
import 'package:placement_stats/Widgets/Student/student_appDrawer.dart';
import 'package:provider/provider.dart';

class UpcomingScheduleScreen extends StatefulWidget {
  static const String routeName = "/upcoming-schedule";

  @override
  _UpcomingScheduleScreenState createState() => _UpcomingScheduleScreenState();
}

class _UpcomingScheduleScreenState extends State<UpcomingScheduleScreen>
    with SingleTickerProviderStateMixin {
  final _skinColor = Color(0xffffe9e3);

  AnimationController _controller;
  Animation _animation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    Provider.of<Schedule>(context, listen: false)
        .getandsetSchedules()
        .then((_) {
      setState(() {
        _isLoading = false;
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final schedules = Provider.of<Schedule>(context).schedules;
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
            _isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  )
                : Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeTransition(
                        opacity: _animation,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _skinColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ScheduleBuilder(schedules),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
