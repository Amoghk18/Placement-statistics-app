import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen_recruiter.dart';
import 'package:placement_stats/Screens/AuthScreens/signUp_recruiter.dart';
import 'package:placement_stats/Screens/AuthScreens/signUp_student.dart';
import 'package:placement_stats/Screens/HomeScreens/Recruiter/recruiter_home_screen.dart';
import 'package:placement_stats/Screens/HomeScreens/Student/home_screen.dart';
import 'package:placement_stats/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),//HomeScreen(),//HomeScreenStudent(), //SignUpStudent(),
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        LoginForm.routeName: (ctx) => LoginForm(),
        SignUpRecruiter.routeName: (ctx) => SignUpRecruiter(),
        SignUpStudent.routeName: (ctx) => SignUpStudent(),
        LoginFormRecruiter.routeName: (ctx) => LoginFormRecruiter(),
        HomeScreenStudent.routeName: (ctx) => HomeScreenStudent(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}
