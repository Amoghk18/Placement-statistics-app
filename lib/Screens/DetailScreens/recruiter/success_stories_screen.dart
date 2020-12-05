import 'package:flutter/material.dart';
import 'package:placement_stats/Widgets/Recruiter/build_success_stories.dart';

class SuccessStoriesScreen extends StatelessWidget {
  static const String routeName = "/success-stories";

  final _skinColor = Color(0xffffe9e3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Success Stories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Text(
                "Success stories of Alumni, Know them, might help. Contact them if need be!",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: _skinColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SuccessStoresBuilder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
