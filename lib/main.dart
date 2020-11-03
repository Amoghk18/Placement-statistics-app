import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen.dart';
import 'package:placement_stats/Screens/AuthScreens/signUp_recruiter.dart';
import 'package:placement_stats/Screens/AuthScreens/signUp_student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUpStudent(),
      routes: {
        LoginForm.routeName: (ctx) => LoginForm(),
        SignUpRecruiter.routeName: (ctx) => SignUpRecruiter(),
        SignUpStudent.routeName: (ctx) => SignUpStudent(),
      },
    );
  }
}
