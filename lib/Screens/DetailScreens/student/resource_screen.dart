import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:placement_stats/Providers/Auth.dart';
import 'package:placement_stats/Providers/Blog.dart';
import 'package:placement_stats/Providers/Course.dart';
import 'package:placement_stats/Providers/Ebook.dart';
import 'package:placement_stats/Providers/Link.dart';
import 'package:placement_stats/Widgets/Student/build_blogs.dart';
import 'package:placement_stats/Widgets/Student/build_courses.dart';
import 'package:placement_stats/Widgets/Student/build_ebooks.dart';
import 'package:placement_stats/Widgets/Student/build_links.dart';
import 'package:placement_stats/Widgets/Student/student_appDrawer.dart';
import 'package:provider/provider.dart';

class ResourceScreen extends StatefulWidget {
  static const String routeName = "/resources";

  @override
  _ResourceScreenState createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen>
    with SingleTickerProviderStateMixin {
  var _selected = "Blogs";

  final _categories = ["Blogs", "E-books", "Courses", "Links"];
  AnimationController _controller;
  Animation _animation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    Provider.of<Blog>(context, listen: false).getAndSetBlogs().then((_) {
      setState(() {
        _isLoading = false;
        _controller.forward();
      });
    });
    Provider.of<Ebook>(context, listen: false).getAndSetEbooks();
    Provider.of<Course>(context, listen: false).getAndSetCourses();
    Provider.of<Link>(context, listen: false).getAndSetLinks();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildList(int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = _categories[i];
          _controller.reset();
          _controller.forward();
        });
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Align(
                child: Text(
                  _categories[i],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                alignment: Alignment.center,
              ),
              _selected == _categories[i]
                  ? Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.check,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                      right: 0,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResource() {
    if (_selected == "Blogs") {
      final blogs = Provider.of<Blog>(context, listen: false).blogs;
      return BlogBuilder(blogs);
    }
    if (_selected == "E-books") {
      final ebooks = Provider.of<Ebook>(context, listen: false).ebooks;
      return BuildEbooks(ebooks);
    }
    if (_selected == "Courses") {
      final courses = Provider.of<Course>(context, listen: false).courses;
      return CourseBuilder(courses);
    }
    if (_selected == "Links") {
      final links = Provider.of<Link>(context, listen: false).links;
      return LinkBuilder(links);
    }
  }

  String _getAbbrName(String name) {
    final arr = name.split(" ");
    var str = "";
    arr.forEach((e) => str += e[0]);
    return str;
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Auth>(context).student;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: StudentDrawer(3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Placement Stats",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.8,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange[300],
              child: FittedBox(
                child: Text(
                  _getAbbrName(data.name),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Text(
                "Resources",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text(
                "Resources are updated everyday!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (ctx, i) => _buildList(i),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Today's Top $_selected!",
                style: TextStyle(fontSize: 20),
              ),
            ),
            _isLoading
                ? Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Lottie.asset(
                              "assets/images/loading-worms-json.json",
                              animate: true,
                              repeat: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(15)),
                      child: FadeTransition(
                        child: _buildResource(),
                        opacity: _animation,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
