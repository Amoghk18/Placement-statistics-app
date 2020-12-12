import 'package:flutter/material.dart';

class CourseBuilder extends StatelessWidget {
  final _courses;
  CourseBuilder(this._courses);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (ctx, i) => Divider(
          color: Colors.white,
          indent: 15,
          endIndent: 15,
        ),
        itemCount: _courses.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(
            _courses[i].name,
            style: TextStyle(color: Colors.white, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            "${_courses[i].creator}\n${_courses[i].source}",
            style: TextStyle(color: Colors.white70, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          isThreeLine: true,
          trailing: Icon(
            Icons.launch,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
