import 'package:flutter/material.dart';

class BuildEbooks extends StatelessWidget {

  final _ebooks = [
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
    {
      "Name": "Python Complete Reference",
      "Author": "Abc Xyz",
      "link": "https://abc.com"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (ctx, i) => Divider(color: Colors.white, indent: 15, endIndent: 15,),
        itemCount: _ebooks.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(
            _ebooks[i]["Name"],
            style: TextStyle(color: Colors.white, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _ebooks[i]["Author"],
            style: TextStyle(color: Colors.white70, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.launch, color: Colors.white,),
        ),
      ),
    );
  }
}