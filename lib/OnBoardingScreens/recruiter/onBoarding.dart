import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen_recruiter.dart';

class OnBoardingScreenRecruiter extends StatefulWidget {
  static const String routeName = "/onboarding-recruiter";
  @override
  _OnBoardingScreenRecruiterState createState() =>
      _OnBoardingScreenRecruiterState();
}

class _OnBoardingScreenRecruiterState extends State<OnBoardingScreenRecruiter> {
  final _onboardingKey = GlobalKey<IntroductionScreenState>();

  final _images = {
    "easy": "assets/images/easy.jpg",
    "talent": "assets/images/talent.jpg",
    "time": "assets/images/timeismoney.jpg",
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
    Navigator.of(context).pushReplacementNamed(LoginFormRecruiter.routeName);
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
          title: "It's EASY",
          image: _buildImg(_images["easy"]),
          body:
              "Setup your company profile and recruitment procedure, leave the rest to us 😉",
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
            pageColor: Color(0xff522e24),
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Find new Talent",
          image: _buildImg(_images["talent"]),
          body:
              "Find the right talent required for your company in just a few steps!",
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
            pageColor: Color(0xff3fc1c9),
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Time is Money",
          image: _buildImg(_images["time"]),
          body:
              "We know that your time is precious and we strive to save your time!",
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
            pageColor: Color(0xffff9a3c),
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Finally, The GOAL",
          image: _buildImg(_images["goal"]),
          body: "We help you to build your company grow in a right way!",
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
