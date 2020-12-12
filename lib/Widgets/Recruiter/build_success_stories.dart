import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessStoresBuilder extends StatefulWidget {
  final _stories;
  SuccessStoresBuilder(this._stories);
  @override
  _SuccessStoresBuilderState createState() => _SuccessStoresBuilderState();
}

class _SuccessStoresBuilderState extends State<SuccessStoresBuilder> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget._stories.length,
        itemBuilder: (ctx, i) => ExpansionTile(
          title: Text(
            widget._stories[i].name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          subtitle: Text(
            widget._stories[i].college,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          expandedAlignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                'Recruited in ${widget._stories[i].company}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                'Package - ${widget._stories[i].package}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                  child: Text(
                    'Mail - ${widget._stories[i].contact}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  child: RaisedButton(
                    onPressed: (){
                      Clipboard.setData(ClipboardData(text: widget._stories[i].contact));
                      setState(() {
                        widget._stories[i].haveCopied = true;
                      });
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text(widget._stories[i].haveCopied ? "Copied!" : "Copy"),
                  ),
                ),
              ],
            )
          ],
          tilePadding: EdgeInsets.all(10),
          backgroundColor: Colors.teal[400],
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
