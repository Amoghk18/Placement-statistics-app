import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrePlacementTalkScreen extends StatefulWidget {
  static const String routeName = "/pre-placement-talk";
  @override
  _PrePlacementTalkScreenState createState() => _PrePlacementTalkScreenState();
}

class _PrePlacementTalkScreenState extends State<PrePlacementTalkScreen> {
  final _color = Color(0xff364f6b);

  DateTime _selectedDate;
  TimeOfDay _selectedTime;
  final _data = {
    "date": "",
    "time": "",
    "agenda": "",
    "links": "",
  };

  void _selectDate(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 30),
      ),
    )
        .then((value) => setState(() {
              _selectedDate = value;
            }))
        .catchError((err) {
      print(err);
    });
  }

  void _selectTime(BuildContext ctx) {
    showTimePicker(context: ctx, initialTime: TimeOfDay.now())
        .then((value) => setState(() {
              _selectedTime = value;
            }))
        .catchError((err) {
      print(err);
    });
  }

  final _formKey = GlobalKey<FormState>();

  void _showAlert(String val) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: ListTile(
          leading: Icon(
            Icons.info,
            color: Colors.red,
          ),
          title: Text(
            "No $val selected!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        content: Text(
          "Please select a $val. This $val must be the $val on which you will be conducting the talk.",
        ),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  void _notify() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    if (_selectedDate == null && _selectedTime == null) {
      _showAlert("date and time");
    } else {
      if (_selectedDate == null) {
        _showAlert("date");
      }
      if (_selectedTime == null) {
        _showAlert("time");
      }
    }
    _data["date"] = _selectedDate.toString();
    _data["time"] = _selectedTime.format(context);
    print(_data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(
        backgroundColor: _color,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Pre  Placement  Talk  Notification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                    alignment: Alignment.center,
                    child: Text(
                      "We will send an email with the date and ajenda you mention below and also students will be able to see it in their app!",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      "Select the date and time for the talk!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(40, 20, 0, 10),
                        child: RaisedButton(
                          onPressed: () => _selectDate(context),
                          child: Text("Select date"),
                        ),
                      ),
                      SizedBox(width: 50),
                      Container(
                        child: Text(
                          _selectedDate == null
                              ? "No Date selected yet"
                              : "${DateFormat.d().format(_selectedDate)} ${DateFormat.EEEE().format(_selectedDate)}, ${DateFormat.MMM().format(_selectedDate)} ${DateFormat.y().format(_selectedDate)}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(40, 20, 0, 10),
                        child: RaisedButton(
                          onPressed: () => _selectTime(context),
                          child: Text("Select time"),
                        ),
                      ),
                      SizedBox(width: 50),
                      Container(
                        child: Text(
                          _selectedTime == null
                              ? "No Time selected yet"
                              : _selectedTime.format(context),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 20, 20, 10),
                    child: Text(
                      "Please enter the following details",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 20, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Agenda of the talk",
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          ),
                          labelText: "Agenda",
                          labelStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          counterStyle: TextStyle(color: Colors.white70)),
                      cursorColor: Colors.white70,
                      style: TextStyle(color: Colors.white),
                      maxLength: 500,
                      validator: (val) {
                        if (val.isEmpty) return "Agenda cannot be empty!";
                        return null;
                      },
                      onSaved: (val) => _data["agenda"] = val,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 20, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Useful links for students",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                        ),
                        labelText: "Links",
                        labelStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        counterStyle: TextStyle(color: Colors.white70),
                      ),
                      cursorColor: Colors.white70,
                      style: TextStyle(color: Colors.white),
                      maxLength: 500,
                      validator: (val) {
                        if (val.isEmpty) return "Links cannot be empty!";
                        return null;
                      },
                      onSaved: (val) => _data["links"] = val,
                    ),
                  ),
                  SizedBox(height: 40),
                  Align(
                    child: OutlineButton(
                      onPressed: _notify,
                      borderSide: BorderSide(style: BorderStyle.none),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Notify!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
