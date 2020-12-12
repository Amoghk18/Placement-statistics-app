import 'package:flutter/material.dart';

class LinkBuilder extends StatelessWidget {
  final _links;
  LinkBuilder(this._links); 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (ctx, i) => Divider(
          color: Colors.white,
          indent: 15,
          endIndent: 15,
        ),
        itemCount: _links.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(
            _links[i].name,
            style: TextStyle(color: Colors.white, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _links[i].creator,
            style: TextStyle(color: Colors.white70, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(
            Icons.launch,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
