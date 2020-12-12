import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen.dart';
import 'package:placement_stats/Screens/HomeScreens/Student/home_screen.dart';

class SignUpStudent extends StatefulWidget {
  static const String routeName = "/signUp-student";
  @override
  _SignUpStudentState createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> {
  final _userData = {
    "name": "",
    "email": "",
    "usn": "",
    "sem": "",
    "dept": "",
    "password": "",
    "confirmPass": "",
    "role": "student",
  };

  final _semester = [1, 2, 3, 4, 5, 6, 7, 8];
  final _departments = [
    "CSE",
    "ISE",
    "ECE",
    "EEE",
    "Mechanical",
    "Aerospace",
    "Chemical",
    "Civil"
  ];

  var _sem = "";
  var _dept = "";

  final _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();
  final _usnFocus = FocusNode();
  final _passFocus = FocusNode();
  final _confirmFocus = FocusNode();

  TapGestureRecognizer _ontap;
  var _showPassword = false;
  var _showCPassword = false;
  Color _skinColor = Color(0xffffe9e3);
  Color _borderColor = Color(0xff681313);

  @override
  void initState() {
    _ontap = TapGestureRecognizer()..onTap = _handleTap;
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _ontap.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _handleTap() {
    Navigator.of(context).pushReplacementNamed(LoginForm.routeName);
  }

  void _signUp() {
    if (!_formKey.currentState.validate()) return;
    if (_userData["password"] != _userData["confirmPass"]) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Password error"),
          content: Text("Passwords do not match!"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }
    _formKey.currentState.save();
    print(_userData);
    Navigator.of(context).pushReplacementNamed(HomeScreenStudent.routeName);
  }

  Widget _buildImg(String name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: AssetImage(
            name,
          ),
          fit: BoxFit.cover,
          image: AssetImage(
            name,
          ),
        ),
      ),
    );
  }

  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              color: Colors.green,
              child: Column(
                children: [
                  _buildImg("assets/images/signup.jpg"),
                  const Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      "Set your Account up!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Sign Up to access all the awesome features.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "We won't disclose your data to anyone.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "We give complete privacy to our users.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Swipe left!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: _skinColor,
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.black,
                        indent: 50,
                        endIndent: 50,
                        height: 20,
                        thickness: 2,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign Up as a Student",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 26,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                        child: TextFormField(
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
                              Icons.person,
                              color: Colors.black,
                            ),
                            labelText: "Name",
                            hintText: "Enter your Name",
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
                            FocusScope.of(context).requestFocus(_emailFocus);
                          },
                          onSaved: (val) => _userData["name"] = val,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter a valid name";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                        child: TextFormField(
                          focusNode: _emailFocus,
                          keyboardType: TextInputType.emailAddress,
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
                              Icons.mail,
                              color: Colors.black,
                            ),
                            labelText: "Email",
                            hintText: "Enter your Email Id",
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
                            FocusScope.of(context).requestFocus(_usnFocus);
                          },
                          onSaved: (val) => _userData["email"] = val,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter a valid email id";
                            }
                            if (!val.contains("@")) {
                              return "Please enter a valid email id";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                        child: TextFormField(
                          focusNode: _usnFocus,
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
                              Icons.person,
                              color: Colors.black,
                            ),
                            labelText: "USN",
                            hintText: "Enter your USN",
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
                            FocusScope.of(context).requestFocus(_passFocus);
                          },
                          onSaved: (val) => _userData["usn"] = val,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter a valid USN";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                        child: Row(
                          children: [
                            Flexible(
                              child: DropdownButtonFormField<String>(
                                iconEnabledColor: Colors.black,
                                items: _semester
                                    .map((sem) => DropdownMenuItem<String>(
                                          child: Text("$sem"),
                                          value: "$sem",
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _sem = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                    gapPadding: 0,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                    gapPadding: 0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  labelText: "Semester",
                                ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                dropdownColor: Colors.white,
                                elevation: 0,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Select a semester";
                                  }
                                  return null;
                                },
                                onSaved: (val) => _userData["sem"] = val,
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: DropdownButtonFormField<String>(
                                iconEnabledColor: Colors.black,
                                items: _departments
                                    .map(
                                      (dept) => DropdownMenuItem<String>(
                                        child: Text(dept),
                                        value: dept,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _dept = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                    gapPadding: 0,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                    gapPadding: 0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  labelText: "Department",
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                dropdownColor: Colors.white,
                                elevation: 0,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Select a department";
                                  }
                                  return null;
                                },
                                onSaved: (val) => _userData["dept"] = val,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                        child: TextFormField(
                          focusNode: _passFocus,
                          obscureText: _showPassword ? false : true,
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
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? FontAwesome.eye_slash
                                    : FontAwesome.eye,
                                color: Colors.black,
                              ),
                            ),
                            labelText: "Password",
                            hintText: "Enter your password",
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
                            FocusScope.of(context).requestFocus(_confirmFocus);
                          },
                          onSaved: (val) => _userData["password"] = val,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter a valid password";
                            }
                            if (val.length < 6) {
                              return "Password must be at least 6 characters long";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                        child: TextFormField(
                          focusNode: _confirmFocus,
                          obscureText: _showCPassword ? false : true,
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
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showCPassword = !_showCPassword;
                                });
                              },
                              child: Icon(
                                _showCPassword
                                    ? FontAwesome.eye_slash
                                    : FontAwesome.eye,
                                color: Colors.black,
                              ),
                            ),
                            labelText: "Confirm Password",
                            hintText: "Confirm your password",
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
                          onSaved: (val) => _userData["confirmPass"] = val,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter a valid password";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textColor: _borderColor,
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.none,
                        ),
                        onPressed: _signUp,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "Login",
                                recognizer: _ontap,
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        indent: 100,
                        endIndent: 100,
                        height: 10,
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
