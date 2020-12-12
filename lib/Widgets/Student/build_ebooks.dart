import 'package:flutter/material.dart';

class BuildEbooks extends StatelessWidget {
  final _ebooks;
  BuildEbooks(this._ebooks);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (ctx, i) => Divider(color: Colors.white, indent: 15, endIndent: 15,),
        itemCount: _ebooks.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(
            _ebooks[i].name,
            style: TextStyle(color: Colors.white, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _ebooks[i].author,
            style: TextStyle(color: Colors.white70, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.launch, color: Colors.white,),
        ),
      ),
    );
  }
}