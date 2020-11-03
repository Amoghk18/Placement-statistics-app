import 'package:flutter/material.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen.dart';

class HomePage extends StatelessWidget {
  void pushToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(LoginForm.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Portal",
              style: TextStyle(
                fontSize: 36,
                color: Color(0xFF71adb5),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sign in / Sign Up as a",
                style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFF71adb5),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(28),
              child: OutlineButton(
                child: Text(
                  "Student",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xFFfc6b3f),
                  ),
                ),
                highlightedBorderColor: Colors.orange[200],
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Color(0xFFff5722),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () => pushToLogin(context),
              ),
            ),
            Container(
              margin: EdgeInsets.all(28),
              child: OutlineButton(
                child: Text(
                  "Recruiter",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xFFfc6b3f),
                  ),
                ),
                highlightedBorderColor: Colors.red[100],
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Color(0xFFff5722),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () => pushToLogin(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
