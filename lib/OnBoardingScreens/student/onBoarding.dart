import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen.dart';

class OnBoardingScreenStudent extends StatefulWidget {
  static const String routeName = "/onboarding-student";
  @override
  _OnBoardingScreenStudentState createState() =>
      _OnBoardingScreenStudentState();
}

class _OnBoardingScreenStudentState extends State<OnBoardingScreenStudent>
    with SingleTickerProviderStateMixin {
  final _onboardingKey = GlobalKey<IntroductionScreenState>();

  final _images = {
    "charts": "assets/images/chart.jpg",
    "exp": "assets/images/exp.jpg",
    "schedule": "assets/images/schedule.jpg",
    "resource": "assets/images/resources.jpg",
    "goal": "assets/images/helpyougrow.jpg",
  };

  Widget _buildImg(String name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: AssetImage(
            name,
          ),
          fit: BoxFit.cover,
          image: AssetImage(
            name,
          ),
        ),
      ),
    );
  }

  void _whenDone() {
    Navigator.of(context).pushReplacementNamed(LoginForm.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _onboardingKey,
      onDone: _whenDone,
      showSkipButton: true,
      skip: const Text(
        "Skip",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18,
        ),
      ),
      next: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 26,
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      dotsDecorator: const DotsDecorator(
        activeColor: Color(0xff151680),
        size: Size(10.0, 10.0),
        color: Color(0xffffffff),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Charts and Graphs",
          image: _buildImg(_images["charts"]),
          body:
              "Interactive and informative charts that help you understand the stats better!",
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 19.0,
              color: Colors.white70,
            ),
            descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Color(0xff009f9d), //Colors.yellow[100],
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Experiences",
          image: _buildImg(_images["exp"]),
          body:
              "Share your experience and view experience of others for betterment of the whole community!",
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 19.0,
              color: Colors.white70,
            ),
            descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Colors.blueGrey,
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Resource",
          image: _buildImg(_images["resource"]),
          body:
              "Online resources to learn from and get better with every passing day!",
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 19.0,
              color: Colors.white70,
            ),
            descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Colors.red[300],
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Schedule",
          image: _buildImg(_images["schedule"]),
          body:
              "Never miss any important schedule by using the upcoming schedule information!",
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 19.0,
              color: Colors.white70,
            ),
            descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Colors.purple,
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Finally, The GOAL",
          image: _buildImg(_images["goal"]),
          body: "We help you to build your career in a right way!",
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 19.0,
              color: Colors.white70,
            ),
            descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Colors.teal,
            imagePadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
