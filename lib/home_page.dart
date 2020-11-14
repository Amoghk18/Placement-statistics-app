import 'package:flutter/material.dart';
import 'package:placement_stats/OnBoardingScreens/recruiter/onBoarding.dart';
import 'package:placement_stats/OnBoardingScreens/student/onBoarding.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home-page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  void pushToLogin(BuildContext context, String goto) {
    goto == "student"
        ? Navigator.of(context)
            .pushReplacementNamed(OnBoardingScreenStudent.routeName)
        : Navigator.of(context)
            .pushReplacementNamed(OnBoardingScreenRecruiter.routeName);
  }

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.lightBlueAccent,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 60, 20, 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [BoxShadow(color: Colors.white, blurRadius: 40)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 30),
                    child: FadeTransition(
                      opacity: _animation,
                      child: Image.asset(
                        "assets/images/welcome.jpg",
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.33,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Sign in / Sign Up as a",
                          style: TextStyle(
                              fontSize: 26,
                              color: Color(0xFF71adb5),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(28),
                        child: OutlineButton(
                          child: Text(
                            " Student ",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          textColor: Color(0xFFfc6b3f),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: _animation.isCompleted
                              ? () => pushToLogin(context, "student")
                              : () {},
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        margin: EdgeInsets.all(28),
                        child: OutlineButton(
                          child: Text(
                            "Recruiter",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          textColor: Color(0xFFfc6b3f),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: _animation.isCompleted
                              ? () => pushToLogin(context, "recruiter")
                              : () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
