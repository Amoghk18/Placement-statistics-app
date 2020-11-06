import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placement_stats/home_page.dart';

class RecruiterDrawer extends StatelessWidget {
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 30,
                child: FittedBox(
                  child: Text("RN"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
              child: Text(
                "Recruiter Name",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
              child: Text(
                "Recruiter@xyzmail.com",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 40),
            ListTile(
              leading: Icon(
                FontAwesome.home,
                size: 30,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(MaterialIcons.trending_up,
                  size: 30, color: Colors.white),
              title: Text(
                "Placement Statistics",
                style: textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(FontAwesome.graduation_cap,
                  size: 30, color: Colors.white),
              title: Text(
                "Share your Experience",
                style: textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Ionicons.ios_book, size: 30, color: Colors.white),
              title: Text(
                "Student Resource",
                style: textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading:
                  Icon(FontAwesome.calendar, size: 30, color: Colors.white),
              title: Text(
                "Upcoming Schedule",
                style: textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading:
                  Icon(Icons.exit_to_app, size: 30, color: Colors.white),
              title: Text(
                "Logout",
                style: textStyle,
              ),
              onTap: () => Navigator.of(context).pushReplacementNamed(HomePage.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
