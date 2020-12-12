import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:placement_stats/Providers/Hiring_process.dart';
import 'package:provider/provider.dart';

class CampusPlacementScreen extends StatefulWidget {
  static const String routeName = "/campus-placement";
  @override
  _CampusPlacementScreenState createState() => _CampusPlacementScreenState();
}

class _CampusPlacementScreenState extends State<CampusPlacementScreen> {
  final Color _skinColor = Color(0xffffe9e3);
  final Color _borderColor = Color(0xff681313);
  final _process = {
    "name": "Faro", // fetch from user data
    "year": DateFormat.y().format(DateTime.now()),
    "jd": "",
    "eligibilityCriteria": "",
    "duration": "",
    "location": "",
    "stipendOrCtc": "",
    "process": "",
    "rounds": ""
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var _offOrOn = "Online";
  var _isLoading = false;

  final _roundsFocus = FocusNode();
  final _descFocus = FocusNode();
  final _moneyFocus = FocusNode();
  final _eligibFocus = FocusNode();
  final _locationFocus = FocusNode();
  final _durationFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

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

  void _submit() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    _process["process"] = "$_offOrOn, ${_process['process']}";
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<HiringProcess>(context, listen: false)
          .createProcess(_process);
    } catch (err) {
      sfDialog("Error", "Something went wrong. Please try again later");
    } finally {
      setState(() {
        _isLoading = false;
      });
      sfDialog("Success",
          "Process has been created. The same will be sent to students.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _offOn = Row(
      children: [
        Text(
          "Test will be held ",
          style: TextStyle(
            color: _borderColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              _offOrOn = "Online";
            });
          },
          child: Text(
            "Online",
            style: _offOrOn == "Online"
                ? TextStyle(
                    color: _borderColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  )
                : null,
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _offOrOn = "Offline";
            });
          },
          child: Text(
            "Offline",
            style: _offOrOn == "Offline"
                ? TextStyle(
                    color: _borderColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  )
                : null,
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: _skinColor,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        child: Icon(Icons.arrow_back),
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        "Campus Placement Process!",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: _borderColor,
                          wordSpacing: 1.5,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 60, 20),
                      child: Text(
                        "Information about the placement process is essential for students to know what they will be facing and hence helps them to prepare well and prepare right!",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: _offOn,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      initialValue: _process["process"],
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        prefixIcon: const Icon(
                          Icons.computer,
                          color: Colors.black,
                        ),
                        labelText: "Process",
                        hintText: "Process of hiring",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _skinColor),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _borderColor),
                          gapPadding: 5,
                        ),
                      ),
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(_roundsFocus);
                      },
                      onChanged: (val) {
                        _process["platform"] = val;
                      },
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["platform"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid platform name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _roundsFocus,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        prefixIcon: const Icon(
                          FontAwesome.reorder,
                          color: Colors.black,
                        ),
                        labelText: "Rounds",
                        hintText: "Number of Rounds",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _skinColor),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _borderColor),
                          gapPadding: 5,
                        ),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_descFocus);
                      },
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["rounds"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid number of rounds";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _descFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        prefixIcon: const Icon(
                          Icons.details,
                          color: Colors.black,
                        ),
                        labelText: "Job Description",
                        hintText: "Job desciption",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _skinColor),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _borderColor),
                          gapPadding: 5,
                        ),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_eligibFocus);
                      },
                      maxLength: 500,
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["jd"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid job description";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _eligibFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        prefixIcon: const Icon(
                          Icons.details,
                          color: Colors.black,
                        ),
                        labelText: "Eligibility Criteria",
                        hintText: "Eligibility Criteria",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _skinColor),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _borderColor),
                          gapPadding: 5,
                        ),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_locationFocus);
                      },
                      maxLength: 500,
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["eligibilityCriteria"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid Criteria";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _locationFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        prefixIcon: const Icon(
                          Icons.monetization_on,
                          color: Colors.black,
                        ),
                        labelText: "Location",
                        hintText: "Location of internship/job",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _skinColor),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _borderColor),
                          gapPadding: 5,
                        ),
                      ),
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(_durationFocus);
                      },
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["location"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid Location";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _durationFocus,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        prefixIcon: const Icon(
                          Icons.monetization_on,
                          color: Colors.black,
                        ),
                        labelText: "Duration",
                        hintText: "Duration of internship/job",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _skinColor),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _borderColor),
                          gapPadding: 5,
                        ),
                      ),
                      onFieldSubmitted: (val) {
                        FocusScope.of(context).requestFocus(_moneyFocus);
                      },
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["duration"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid Duration";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _moneyFocus,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 5,
                        ),
                        prefixIcon: const Icon(
                          Icons.monetization_on,
                          color: Colors.black,
                        ),
                        labelText: "Stipend / CTC",
                        hintText: "Stipend or CTC",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _skinColor),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: _borderColor),
                          gapPadding: 5,
                        ),
                      ),
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["stipendOrCtc"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid Stipend / CTC";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  _isLoading
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            ),
                          ),
                      )
                      : OutlineButton(
                          onPressed: _submit,
                          borderSide: BorderSide(style: BorderStyle.none),
                          textColor: _borderColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
