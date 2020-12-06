import 'package:flutter/material.dart';

class ScheduleBuilder extends StatefulWidget {
  @override
  _ScheduleBuilderState createState() => _ScheduleBuilderState();
}

class _ScheduleBuilderState extends State<ScheduleBuilder> {
  final _schedule = [
    {
      "name": "Microsoft pre-placement talk",
      "datetime": "28th Nov at 4 pm",
      "agenda":
          "1) Knowing about the JD and more about the company.\n2) Knowing about the JD and more about the company.\n3) Knowing about the JD and more about the company",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft Webinar",
      "datetime": "28th Nov at 4 pm",
      "agenda":
          "Know more about products of microsoft and discover new technologies offered",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft: Flagship event",
      "datetime": "28th Nov at 4 pm",
      "agenda": "Win the event and get a prize amount upto 50,000!",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft pre-placement talk",
      "datetime": "28th Nov at 4 pm",
      "agenda": "Knowing about the JD and more about the company",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft pre-placement talk",
      "datetime": "28th Nov at 4 pm",
      "agenda": "Knowing about the JD and more about the company",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft pre-placement talk",
      "datetime": "28th Nov at 4 pm",
      "agenda": "Knowing about the JD and more about the company",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft pre-placement talk",
      "datetime": "28th Nov at 4 pm",
      "agenda": "Knowing about the JD and more about the company",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft pre-placement talk",
      "datetime": "28th Nov at 4 pm",
      "agenda": "Knowing about the JD and more about the company",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft pre-placement talk",
      "datetime": "28th Nov at 4 pm",
      "agenda": "Knowing about the JD and more about the company",
      "link": "https://abc.com",
      "isExpanded": false,
    },
    {
      "name": "Microsoft pre-placement talk",
      "datetime": "28th Nov at 4 pm",
      "agenda": "Knowing about the JD and more about the company",
      "link": "https://abc.com",
      "isExpanded": false,
    },
  ];

  Color _borderColor = Color(0xff681313);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _schedule.length,
        itemBuilder: (ctx, i) => ExpansionTile(
          title: Text(
            _schedule[i]["name"],
            style: TextStyle(
              color: _schedule[i]["isExpanded"] ? Colors.white : _borderColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          subtitle: Text(
            _schedule[i]["datetime"],
            style: TextStyle(
              fontSize: 15,
              color: _schedule[i]["isExpanded"] ? Colors.white : Colors.black,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                _schedule[i]["agenda"],
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
                    _schedule[i]["link"],
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
              _schedule[i]["isExpanded"] = val;
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
