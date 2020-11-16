import 'package:flutter/material.dart';

class BlogBuilder extends StatelessWidget {
  final _blogs = [
    {
      "title": "Texts in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "Row in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "Column in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "Container in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "ListView in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "SingleChildScrollView in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "Animations in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "TextStyle in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "Icons in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
    {
      "title": "Icons in Flutter",
      "Author": "Abc Xyz",
      "link": "https://abc.com",
      "image": "https://abc.com",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (ctx, i) => Divider(color: Colors.white, indent: 15, endIndent: 15,),
        itemCount: _blogs.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(
            _blogs[i]["title"],
            style: TextStyle(color: Colors.white, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _blogs[i]["Author"],
            style: TextStyle(color: Colors.white70, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.launch, color: Colors.white,),
        ),
      ),
    );
  }
}
