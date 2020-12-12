import 'package:flutter/material.dart';
import 'package:placement_stats/Providers/Success_story.dart';
import 'package:placement_stats/Widgets/Recruiter/build_success_stories.dart';
import 'package:provider/provider.dart';

class SuccessStoriesScreen extends StatefulWidget {
  static const String routeName = "/success-stories";

  @override
  _SuccessStoriesScreenState createState() => _SuccessStoriesScreenState();
}

class _SuccessStoriesScreenState extends State<SuccessStoriesScreen>
    with SingleTickerProviderStateMixin {
  final _skinColor = Color(0xffffe9e3);

  AnimationController _animationController;
  Animation _animation;
  bool _isLoading = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    Provider.of<SuccessStory>(context, listen: false)
        .getAndSetSuccessStories()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ss = Provider.of<SuccessStory>(context).stories;
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
            _isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.teal,
                      ),
                    ),
                  )
                : Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeTransition(
                        opacity: _animation,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _skinColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SuccessStoresBuilder(ss),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
