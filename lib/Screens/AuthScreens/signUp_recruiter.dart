import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
    "role": "recruiter",
  };

  final _formKey = GlobalKey<FormState>();
  final _companyFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _positionFocus = FocusNode();
  final _passFocus = FocusNode();
  final _confirmFocus = FocusNode();

  TapGestureRecognizer _ontap;
  var _showPassword = false;
  var _showCPassword = false;
  PageController _pageController;
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
                        margin: const EdgeInsets.fromLTRB(50, 0, 0, 10),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "  Sign Up as a Recruiter",
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
                              color: Colors.black,
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
                              color: Colors.black,
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
                          obscureText: _showPassword ? false : true,
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
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(_showPassword
                                  ? FontAwesome.eye_slash
                                  : FontAwesome.eye, color: Colors.black,),
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
                          obscureText: _showCPassword ? false : true,
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
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showCPassword = !_showCPassword;
                                });
                              },
                              child: Icon(_showCPassword
                                  ? FontAwesome.eye_slash
                                  : FontAwesome.eye, color: Colors.black,),
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
                      SizedBox(height: 40),
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
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
