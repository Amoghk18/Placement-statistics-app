import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
  }
}
