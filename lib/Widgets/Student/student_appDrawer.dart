import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class StudentDrawer extends StatefulWidget {
  @override
  _StudentDrawerState createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  final TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 18);

  final _drawerList = [
    {
      "text": "Home",
      "icon": FontAwesome.question,
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
        color: Colors.red,
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
                      color: Colors.white,
                    ),
                    title: Text(
                      _drawerList[i]["text"],
                      style: selected == i
                          ? textStyle.merge(TextStyle(fontSize: 20))
                          : textStyle,
                    ),
                    onTap: () {
                      setState(() {
                        selected = i;
                      });
                    },
                  ),
                ),
              ),
            ),
            // ListTile(
            //   leading: Icon(
            //     FontAwesome.home,
            //     size: 30,
            //     color: Colors.white,
            //   ),
            //   title: Text(
            //     "Home",
            //     style: textStyle,
            //   ),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(MaterialIcons.trending_up,
            //       size: 30, color: Colors.white),
            //   title: Text(
            //     "Placement Statistics",
            //     style: textStyle,
            //   ),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(FontAwesome.graduation_cap,
            //       size: 30, color: Colors.white),
            //   title: Text(
            //     "Share your Experience",
            //     style: textStyle,
            //   ),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Ionicons.ios_book, size: 30, color: Colors.white),
            //   title: Text(
            //     "Student Resource",
            //     style: textStyle,
            //   ),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading:
            //       Icon(FontAwesome.calendar, size: 30, color: Colors.white),
            //   title: Text(
            //     "Upcoming Schedule",
            //     style: textStyle,
            //   ),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading:
            //       Icon(Icons.exit_to_app, size: 30, color: Colors.white),
            //   title: Text(
            //     "Logout",
            //     style: textStyle,
            //   ),
            //   onTap: () => Navigator.of(context).pushReplacementNamed(HomePage.routeName),
            // ),
          ],
        ),
      ),
    );
  }
}
