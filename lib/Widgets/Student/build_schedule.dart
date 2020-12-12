import 'package:flutter/material.dart';

class ScheduleBuilder extends StatefulWidget {
  final _schedule;
  ScheduleBuilder(this._schedule);
  @override
  _ScheduleBuilderState createState() => _ScheduleBuilderState();
}

class _ScheduleBuilderState extends State<ScheduleBuilder> {
  Color _borderColor = Color(0xff681313);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget._schedule.length,
        itemBuilder: (ctx, i) => ExpansionTile(
          title: Text(
            widget._schedule[i].name,
            style: TextStyle(
              color: widget._schedule[i].isExpanded ? Colors.white : _borderColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          subtitle: Text(
            widget._schedule[i].datetime,
            style: TextStyle(
              fontSize: 15,
              color: widget._schedule[i].isExpanded ? Colors.white : Colors.black,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget._schedule[i].agenda,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    widget._schedule[i].link,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: RaisedButton(
                    onPressed: () {},
                    elevation: 0,
                    textColor: Colors.white,
                    color: Colors.black,
                    child: Text("Attend"),
                  ),
                )
              ],
            ),
          ],
          onExpansionChanged: (val) {
            setState(() {
              widget._schedule[i].isExpanded = val;
            });
          },
          tilePadding: EdgeInsets.all(10),
          backgroundColor: Colors.teal[400],
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
