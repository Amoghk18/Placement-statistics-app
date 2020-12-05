import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessStoresBuilder extends StatefulWidget {
  @override
  _SuccessStoresBuilderState createState() => _SuccessStoresBuilderState();
}

class _SuccessStoresBuilderState extends State<SuccessStoresBuilder> {
  final _data = [
    {
      "name": "Abc Xyz",
      "college": "BMS College Of Engineering",
      "company": "Nutanix",
      "package": "12 LPA",
      "contact": "Abc.xyz@gmail.com",
      "haveCopied": false
    },
    {
      "name": "Abc Xyz",
      "college": "BMS College Of Engineering",
      "company": "Nutanix",
      "package": "12 LPA",
      "contact": "Abc1.xyz@gmail.com",
      "haveCopied": false
    },
    {
      "name": "Abc Xyz",
      "college": "BMS College Of Engineering",
      "company": "Nutanix",
      "package": "12 LPA",
      "contact": "Abc2.xyz@gmail.com",
      "haveCopied": false
    },
    {
      "name": "Abc Xyz",
      "college": "BMS College Of Engineering",
      "company": "Nutanix",
      "package": "12 LPA",
      "contact": "Abc3.xyz@gmail.com",
      "haveCopied": false
    },
    {
      "name": "Abc Xyz",
      "college": "BMS College Of Engineering",
      "company": "Nutanix",
      "package": "12 LPA",
      "contact": "Abc4.xyz@gmail.com",
      "haveCopied": false
    },
    {
      "name": "Abc Xyz",
      "college": "BMS College Of Engineering",
      "company": "Nutanix",
      "package": "12 LPA",
      "contact": "Abc5.xyz@gmail.com",
      "haveCopied": false
    },
    {
      "name": "Abc Xyz",
      "college": "BMS College Of Engineering",
      "company": "Nutanix",
      "package": "12 LPA",
      "contact": "Abc6.xyz@gmail.com",
      "haveCopied": false
    },
    {
      "name": "Abc Xyz",
      "college": "BMS College Of Engineering",
      "company": "Nutanix",
      "package": "12 LPA",
      "contact": "Abc7.xyz@gmail.com",
      "haveCopied": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (ctx, i) => ExpansionTile(
          title: Text(
            _data[i]["name"],
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          subtitle: Text(
            _data[i]["college"],
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
                'Recruited in ${_data[i]["company"]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                'Package - ${_data[i]["package"]}',
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
                    'Mail - ${_data[i]["contact"]}',
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
                      Clipboard.setData(ClipboardData(text: _data[i]["contact"]));
                      setState(() {
                        _data[i]["haveCopied"] = true;
                      });
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text(_data[i]["haveCopied"] ? "Copied!" : "Copy"),
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
