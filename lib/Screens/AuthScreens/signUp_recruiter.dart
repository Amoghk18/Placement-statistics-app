import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:placement_stats/Screens/AuthScreens/login_screen_recruiter.dart';
import 'package:placement_stats/Screens/HomeScreens/Recruiter/recruiter_home_screen.dart';

class SignUpRecruiter extends StatefulWidget {
  static const String routeName = "/signUp-recruiter";
  @override
  _SignUpRecruiterState createState() => _SignUpRecruiterState();
}

class _SignUpRecruiterState extends State<SignUpRecruiter> {
  final _userData = {
    "name": "",
    "company": "",
    "email": "",
    "position": "",
    "password": "",
    "confirmPass": "",
  };

  final _formKey = GlobalKey<FormState>();
  final _companyFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _positionFocus = FocusNode();
  final _passFocus = FocusNode();
  final _confirmFocus = FocusNode();

  TapGestureRecognizer _ontap;

  @override
  void initState() {
    _ontap = TapGestureRecognizer()..onTap = _handleTap;
    super.initState();
  }

  @override
  void dispose() {
    _ontap.dispose();
    super.dispose();
  }

  void _handleTap() {
    Navigator.of(context).pushReplacementNamed(LoginFormRecruiter.routeName);
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
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(50, 70, 0, 30),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign Up as a Recruiter",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.blueGrey,
                      decoration: TextDecoration.overline,
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
                        color: Colors.blueGrey,
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
                        borderSide: BorderSide(color: Colors.white),
                        gapPadding: 5,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        gapPadding: 5,
                      ),
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_companyFocus);
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
                    focusNode: _companyFocus,
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
                        Icons.group,
                        color: Colors.blueGrey,
                      ),
                      labelText: "Company Name",
                      hintText: "Company name",
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
                        borderSide: BorderSide(color: Colors.white),
                        gapPadding: 5,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        gapPadding: 5,
                      ),
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailFocus);
                    },
                    onSaved: (val) => _userData["comapny"] = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Please enter a valid company name";
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
                        color: Colors.blueGrey,
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
                        borderSide: BorderSide(color: Colors.white),
                        gapPadding: 5,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        gapPadding: 5,
                      ),
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_positionFocus);
                    },
                    onSaved: (val) => _userData["email"] = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Please enter a valid Email Id";
                      }
                      if (!val.contains("@")) {
                        return "Please enter a valid Email Id";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                  child: TextFormField(
                    focusNode: _positionFocus,
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
                        Icons.work,
                        color: Colors.blueGrey,
                      ),
                      labelText: "Position",
                      hintText: "Position in the company",
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
                        borderSide: BorderSide(color: Colors.white),
                        gapPadding: 5,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        gapPadding: 5,
                      ),
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passFocus);
                    },
                    onSaved: (val) => _userData["position"] = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Please enter a valid position";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                  child: TextFormField(
                    focusNode: _passFocus,
                    obscureText: true,
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
                        Icons.lock,
                        color: Colors.blueGrey,
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
                        borderSide: BorderSide(color: Colors.white),
                        gapPadding: 5,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
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
                        return "Password must be atleast 6 characters long";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                  child: TextFormField(
                    focusNode: _confirmFocus,
                    obscureText: true,
                    keyboardType: TextInputType.name,
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
                        color: Colors.blueGrey,
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
                        borderSide: BorderSide(color: Colors.white),
                        gapPadding: 5,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
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
                SizedBox(height: 40),
                OutlineButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.blueGrey,
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
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        TextSpan(
                          text: "Login",
                          recognizer: _ontap,
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
