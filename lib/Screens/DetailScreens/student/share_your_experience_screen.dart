import 'package:flutter/material.dart';
import 'package:placement_stats/Widgets/Student/exp_formfield.dart';
import 'package:placement_stats/Widgets/Student/student_appDrawer.dart';

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

  void _submit() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    print(_exp);
  }

  @override
  Widget build(BuildContext context) {
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
                  "SN",
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
                            OutlineButton(
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
