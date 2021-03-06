import 'package:flutter/material.dart';
import 'package:placement_stats/Providers/Auth.dart';
import 'package:placement_stats/Providers/Experience.dart';
import 'package:placement_stats/Utils/HttpException.dart';
import 'package:placement_stats/Utils/sfDialog.dart';
import 'package:placement_stats/Widgets/Student/exp_formfield.dart';
import 'package:placement_stats/Widgets/Student/student_appDrawer.dart';
import 'package:provider/provider.dart';

class ShareYourExpScreen extends StatefulWidget {
  static const String routeName = "/share-exp";

  @override
  _ShareYourExpScreenState createState() => _ShareYourExpScreenState();
}

class _ShareYourExpScreenState extends State<ShareYourExpScreen> {
  final Color _skinColor = Color(0xffffe9e3);
  final Color _borderColor = Color(0xff681313);

  final _formKey = GlobalKey<FormState>();

  final _exp = {
    "name": "",
    "company": "",
    "posiion": "",
    "income": "",
    "experience": "",
    "interview": "",
    "suggestions": "",
    "accept": false
  };

  var _isLoading = false;

  void _submit() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    print(_exp);
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Experience>(context, listen: false).shareExp(_exp);
      setState(() {
        _isLoading = false;
      });
      customDialog(
        "Success",
        "Successfully shared your experience!",
        [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          ),
        ],
        context,
      );
    } on HttpException catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
      customDialog(
        "Error",
        err.msg,
        [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          ),
        ],
        context,
      );
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            "Error",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
              "Something went wrong. Please make sure you have a good internet connection."),
        ),
      );
    }
  }

  String _getAbbrName(String name) {
    final arr = name.split(" ");
    var str = "";
    arr.forEach((e) => str += e[0]);
    return str;
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Auth>(context).student;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: StudentDrawer(2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Placement Stats",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.8,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange[300],
              child: FittedBox(
                child: Text(
                  _getAbbrName(data.name),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                child: Text(
                  "Share your Experience",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                child: Text(
                  "Share the experience you gained from Internships / Placements and help us make a better community!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _skinColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                  child: Column(
                    children: [
                      Text(
                        "Share your Valuable Experience!",
                        style: TextStyle(
                          color: _borderColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            ExpFormField(
                              hintText: "Your Name",
                              labelText: "Name",
                              prefixIcon: Icons.person,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Enter a valid name";
                                } else
                                  return null;
                              },
                              onSaved: (val) => _exp["name"] = val,
                            ),
                            ExpFormField(
                              hintText: "Company placed in",
                              labelText: "Company Name",
                              prefixIcon: Icons.business,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Enter a valid company name";
                                } else
                                  return null;
                              },
                              onSaved: (val) => _exp["company"] = val,
                            ),
                            ExpFormField(
                              hintText: "Position you're working in",
                              labelText: "Position",
                              prefixIcon: Icons.business,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Enter a valid position";
                                } else
                                  return null;
                              },
                              onSaved: (val) => _exp["position"] = val,
                            ),
                            ExpFormField(
                              hintText: "CTC / Stipend",
                              labelText: "CTC / Stipend",
                              prefixIcon: Icons.business,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Enter a valid number";
                                } else
                                  return null;
                              },
                              onSaved: (val) => _exp["income"] = val,
                            ),
                            ExpFormField(
                              hintText: "Your Experience",
                              labelText: "Experience",
                              prefixIcon: Icons.business,
                              maxLength: 250,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Experience cannot be empty";
                                } else
                                  return null;
                              },
                              onSaved: (val) => _exp["experience"] = val,
                            ),
                            ExpFormField(
                              hintText: "Interview rounds",
                              labelText: "Interview process",
                              prefixIcon: Icons.business,
                              maxLength: 250,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Interview process cannot be empty";
                                } else
                                  return null;
                              },
                              onSaved: (val) => _exp["interview"] = val,
                            ),
                            ExpFormField(
                              hintText: "Some tips for others",
                              labelText: "Suggestions",
                              prefixIcon: Icons.business,
                              maxLength: 250,
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => _exp["suggestions"] = val,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 0, 10),
                                  alignment: Alignment.centerLeft,
                                  child: Checkbox(
                                    value: _exp["accept"],
                                    onChanged: (val) {
                                      setState(() {
                                        _exp["accept"] = val;
                                      });
                                    },
                                    tristate: false,
                                    checkColor: Colors.orange,
                                    activeColor: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _exp["accept"] = !_exp["accept"];
                                    });
                                  },
                                  child: Container(
                                    child: Text(
                                      "I agree to share my experience",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            _isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black,
                                      ),
                                      strokeWidth: 2,
                                    ),
                                  )
                                : OutlineButton(
                                    onPressed: _submit,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    textColor: _borderColor,
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ),
                                  ),
                            Divider(
                              color: Colors.black,
                              indent: 100,
                              endIndent: 100,
                              thickness: 2,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
