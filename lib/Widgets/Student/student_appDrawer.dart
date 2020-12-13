import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placement_stats/Providers/Auth.dart';
import 'package:placement_stats/Screens/DetailScreens/student/forgot_password.dart';
import 'package:placement_stats/Screens/DetailScreens/student/placement_stats_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/resource_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/share_your_experience_screen.dart';
import 'package:placement_stats/Screens/DetailScreens/student/upcoming_schedule.dart';
import 'package:placement_stats/Screens/HomeScreens/Student/home_screen.dart';
import 'package:placement_stats/home_page.dart';
import 'package:provider/provider.dart';

class StudentDrawer extends StatefulWidget {
  StudentDrawer(this.current);
  int current;
  @override
  _StudentDrawerState createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  final TextStyle textStyle = TextStyle(color: Colors.white60, fontSize: 18);

  final _drawerList = [
    {
      "text": "Home",
      "icon": FontAwesome.home,
    },
    {
      "text": "Placement Statistics",
      "icon": FontAwesome.line_chart,
    },
    {
      "text": "Share your Experience",
      "icon": FontAwesome.graduation_cap,
    },
    {
      "text": "Student Resource",
      "icon": FontAwesome.book,
    },
    {
      "text": "Upcoming Schedule",
      "icon": FontAwesome.calendar,
    },
    {
      "text": "Update password",
      "icon": Icons.lock,
    },
    {
      "text": "Logout",
      "icon": Icons.exit_to_app,
    }
  ];

  int selected;

  @override
  void initState() {
    selected = widget.current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff07617d),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 30,
                child: FittedBox(
                  child: Text("SN"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
              child: Text(
                "Student Name",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
              child: Text(
                "Student.xxyy@bmsce.ac.in",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: _drawerList.length,
                itemBuilder: (ctx, i) => InkWell(
                  child: ListTile(
                    leading: Icon(
                      _drawerList[i]["icon"],
                      size: 30,
                      color: selected == i ? Colors.white : Colors.white60,
                    ),
                    title: Text(
                      _drawerList[i]["text"],
                      style: selected == i
                          ? textStyle.merge(TextStyle(color: Colors.white))
                          : textStyle,
                    ),
                    onTap: () {
                      setState(() {
                        selected = i;
                        var nav = Navigator.of(context);
                        switch (selected) {
                          case 0:
                            nav.pushReplacementNamed(
                                HomeScreenStudent.routeName);
                            break;
                          case 1:
                            nav.pushReplacementNamed(CompanyName.routeName);
                            break;
                          case 2:
                            nav.pushReplacementNamed(
                                ShareYourExpScreen.routeName);
                            break;
                          case 3:
                            nav.pushReplacementNamed(ResourceScreen.routeName);
                            break;
                          case 4:
                            nav.pushReplacementNamed(
                                UpcomingScheduleScreen.routeName);
                            break;
                          case 5:
                            nav.pushNamed(
                              ForgotPasswordStudent.routeName,
                              arguments: {"from": "update"},
                            );
                            break;
                          case 6:
                            Provider.of<Auth>(context, listen: false).logout();
                            nav.pushReplacementNamed(HomePage.routeName);
                            break;
                        }
                      });
                    },
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
