import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placement_stats/Screens/DetailScreens/student/resource_screen.dart';
import 'package:placement_stats/Screens/HomeScreens/Recruiter/recruiter_home_screen.dart';
import 'package:placement_stats/home_page.dart';

class RecruiterDrawer extends StatefulWidget {
  @override
  _RecruiterDrawerState createState() => _RecruiterDrawerState();
}

class _RecruiterDrawerState extends State<RecruiterDrawer> {
  final TextStyle textStyle = TextStyle(color: Colors.white60, fontSize: 18);

  final _drawerList = [
    {
      "text": "Why BMSCE",
      "icon": FontAwesome.question,
    },
    {
      "text": "Success Stories",
      "icon": FontAwesome.graduation_cap,
    },
    {
      "text": "Student Resource",
      "icon": Ionicons.ios_book,
    },
    {
      "text": "Upcoming Schedule",
      "icon": FontAwesome.calendar,
    },
    {
      "text": "Logout",
      "icon": Icons.exit_to_app,
    }
  ];

  var selected = 0;

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
                  child: Text("RN"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
              child: Text(
                "Recruiter Name",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
              child: Text(
                "Recruiter@xyzmail.com",
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
                        switch(selected){
                          case 0:
                            nav.pushReplacementNamed(HomeScreen.routeName);
                            break;
                          case 1:
                          case 2:
                          case 3:
                            nav.pushReplacementNamed(ResourceScreen.routeName);
                            break;
                          case 4:
                          case 5:
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
