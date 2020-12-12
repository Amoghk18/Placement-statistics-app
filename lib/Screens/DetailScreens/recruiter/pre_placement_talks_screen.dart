import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:placement_stats/Providers/Schedule.dart';
import 'package:provider/provider.dart';

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
    "name": "",
    "datetime": "",
    "agenda": "",
    "link": "",
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
  var _isLoading = false;

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

  void sfDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(content),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  void _notify() async {
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
    setState(() {
      _isLoading = true;
    });
    _data["datetime"] =
        "${DateFormat.d().format(_selectedDate)} ${DateFormat.EEEE().format(_selectedDate)}, ${DateFormat.MMM().format(_selectedDate)}" + " at " + _selectedTime.format(context);
    try {
      await Provider.of<Schedule>(context, listen: false).createSchedule(_data);
      sfDialog("Success",
          "Successfully added a pre-placement talk. The students will be notified!");
    } catch (err) {
      sfDialog(
          "Error", "Something went wrong. Please Try again after some time.");
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
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
                  SizedBox(height: 15),
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
                        padding: const EdgeInsets.fromLTRB(40, 10, 0, 10),
                        child: RaisedButton(
                          onPressed: () => _selectDate(context),
                          child: Text("Select date"),
                        ),
                      ),
                      SizedBox(width: 30),
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
                        padding: const EdgeInsets.fromLTRB(40, 10, 0, 10),
                        child: RaisedButton(
                          onPressed: () => _selectTime(context),
                          child: Text("Select time"),
                        ),
                      ),
                      SizedBox(width: 30),
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
                  SizedBox(height: 15),
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
                          hintText: "Title of the talk",
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          ),
                          labelText: "Title",
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
                        if (val.isEmpty) return "Title cannot be empty!";
                        return null;
                      },
                      onSaved: (val) => _data["name"] = val,
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
                        hintText: "Link for the meet",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                        ),
                        labelText: "Link",
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
                      validator: (val) {
                        if (val.isEmpty) return "Link cannot be empty!";
                        return null;
                      },
                      onSaved: (val) => _data["link"] = val,
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    child: _isLoading
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: CircularProgressIndicator(),
                            ),
                        )
                        : OutlineButton(
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
