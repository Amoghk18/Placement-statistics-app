import 'package:flutter/material.dart';

class BlogBuilder extends StatelessWidget {
  final _blogs;
  BlogBuilder(this._blogs);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (ctx, i) => Divider(color: Colors.white, indent: 15, endIndent: 15,),
        itemCount: _blogs.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(
            _blogs[i].title,
            style: TextStyle(color: Colors.white, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _blogs[i].author,
            style: TextStyle(color: Colors.white70, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.launch, color: Colors.white,),
        ),
      ),
    );
  }
}
