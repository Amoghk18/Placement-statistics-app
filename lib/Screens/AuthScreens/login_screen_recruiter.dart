import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placement_stats/Providers/Auth.dart';
import 'package:placement_stats/Screens/AuthScreens/signUp_recruiter.dart';
import 'package:placement_stats/Screens/HomeScreens/Recruiter/recruiter_home_screen.dart';
import 'package:placement_stats/Utils/HttpException.dart';
import 'package:placement_stats/Utils/sfDialog.dart';
import 'package:provider/provider.dart';

class LoginFormRecruiter extends StatefulWidget {
  static const String routeName = "/login-recruiter";
  @override
  _LoginFormRecruiterState createState() => _LoginFormRecruiterState();
}

class _LoginFormRecruiterState extends State<LoginFormRecruiter> {
  var _email;
  var _password;
  final _role = "recruiter";
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  var _isLoading = false;

  TapGestureRecognizer _ontap;
  var _showPassword = false;

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
    Navigator.of(context).pushReplacementNamed(SignUpRecruiter.routeName);
  }

  void _login() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false)
          .login(_email, _password, _role);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
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
      customDialog(
        "Error",
        "Something went wrong. Please check your connection and try again later.",
        [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          ),
        ],
        context,
      );
    }
  }

  Widget _buildImg(String name) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildImg("assets/images/login.jpg"),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Divider(
                      thickness: 2,
                      indent: 50,
                      endIndent: 50,
                      color: Colors.black,
                      height: 40,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                      child: TextFormField(
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
                            Icons.person,
                            color: Colors.blueGrey,
                          ),
                          labelText: "Email",
                          hintText: "Enter your Email",
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
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
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                            gapPadding: 5,
                          ),
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_focusNode);
                        },
                        onSaved: (val) => _email = val,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Please enter a valid email";
                          }
                          RegExp rg = new RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                          if (!rg.hasMatch(val)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        obscureText: _showPassword ? false : true,
                        focusNode: _focusNode,
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
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Icon(_showPassword
                                ? FontAwesome.eye_slash
                                : FontAwesome.eye),
                          ),
                          labelText: "Password",
                          hintText: "Enter your password",
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
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
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                            gapPadding: 5,
                          ),
                        ),
                        onSaved: (val) => _password = val,
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
                    const SizedBox(height: 40),
                    _isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.black,
                                ),
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : OutlineButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textColor: Colors.blueAccent,
                            onPressed: _login,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            TextSpan(
                              text: "Sign Up",
                              recognizer: _ontap,
                              style: TextStyle(color: Colors.orange),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      indent: 100,
                      endIndent: 100,
                      color: Colors.black,
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
