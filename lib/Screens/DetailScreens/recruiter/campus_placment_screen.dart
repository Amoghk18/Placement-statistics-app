import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CampusPlacementScreen extends StatefulWidget {
  static const String routeName = "/campus-placement";
  @override
  _CampusPlacementScreenState createState() => _CampusPlacementScreenState();
}

class _CampusPlacementScreenState extends State<CampusPlacementScreen> {
  final Color _skinColor = Color(0xffffe9e3);
  final Color _borderColor = Color(0xff681313);
  final _process = {
    "offOrOn": "Online",
    "platform": "",
    "rounds": "",
    "desc": "",
    "filtering": "",
    "stipendOrCtc": ""
  };

  final _roundsFocus = FocusNode();
  final _descFocus = FocusNode();
  final _filterFocus = FocusNode();
  final _moneyFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  void _submit(){
    if(!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    print(_process);
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
              _process["offOrOn"] = "Online";
            });
          },
          child: Text(
            "Online",
            style: _process["offOrOn"] == "Online"
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
              _process["offOrOn"] = "Offline";
            });
          },
          child: Text(
            "Offline",
            style: _process["offOrOn"] == "Offline"
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
                  _process["offOrOn"] == "Online"
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                          child: TextFormField(
                            initialValue: _process["platform"],
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
                              labelText: "Platform",
                              hintText: "Name of the Platform",
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
                        )
                      : Container(),
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
                          Icons.details,
                          color: Colors.black,
                        ),
                        labelText: "Description",
                        hintText: "Brief description of Rounds",
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
                        FocusScope.of(context).requestFocus(_filterFocus);
                      },
                      maxLength: 500,
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["desc"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid description";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _filterFocus,
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
                          FontAwesome.filter,
                          color: Colors.black,
                        ),
                        labelText: "Filtering (Optional)",
                        hintText: "Filtering process",
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
                        FocusScope.of(context).requestFocus(_moneyFocus);
                      },
                      maxLength: 500,
                      cursorColor: Colors.black,
                      onSaved: (val) => _process["filtering"] = val,
                      validator: (val) {
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
                  OutlineButton(
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
