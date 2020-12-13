import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placement_stats/Providers/Auth.dart';
import 'package:placement_stats/Utils/HttpException.dart';
import 'package:placement_stats/Utils/sfDialog.dart';
import 'package:provider/provider.dart';

class ForgotPasswordStudent extends StatefulWidget {
  static const String routeName = "/forgot-password-student";
  @override
  _ForgotPasswordStudentState createState() => _ForgotPasswordStudentState();
}

class _ForgotPasswordStudentState extends State<ForgotPasswordStudent> {
  final _userPass = {
    "newPass": "",
    "confirmNewPass": "",
    "currPass": "",
    "OTP": "",
  };

  final _formKey = GlobalKey<FormState>();
  Color _skinColor = Color(0xffffe9e3);
  Color _borderColor = Color(0xff681313);
  FocusNode _confirm = FocusNode();
  FocusNode _curr = FocusNode();
  var _newP = false;
  var _confnewP = false;
  var _currP = false;

  void _changePass(String from) async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    print(_userPass);
    try {
      if (from == "update") {
        await Provider.of<Auth>(context, listen: false).updatePassword(
          _userPass["currPass"],
          _userPass["newPass"],
        );
      } else {
        await Provider.of<Auth>(context, listen: false)
            .resetPassword(_userPass["OTP"], _userPass["newPass"]);
      }
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Succes!"),
          content: Text("Your password was changed successfully"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                if (from == "update") Navigator.of(context).pop();
              },
              child: Text("Ok"),
            )
          ],
        ),
      );
    } on HttpException catch (err) {
      setState(() {
        _isLoading = false;
      });
      customDialog(
        "Error",
        err.msg,
        [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              if (from == "update") Navigator.of(context).pop();
            },
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
        "Something went wrong. Please check your connection and try again later",
        [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              if (from == "update") Navigator.of(context).pop();
            },
            child: Text("Ok"),
          ),
        ],
        context,
      );
    }
  }

  var _gotOTP = false;
  var _otpLoading = false;
  var _isLoading = false;

  void _getOtp(String from) async {
    try {
      setState(() {
        _otpLoading = true;
      });
      await Provider.of<Auth>(context, listen: false).forgotPassword();
      setState(() {
        _otpLoading = false;
        _gotOTP = true;
      });
      customDialog(
        "Success",
        "Email has been successfully sent!",
        [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Ok"),
          ),
        ],
        context,
      );
    } on HttpException catch (err) {
      setState(() {
        _otpLoading = false;
        _gotOTP = true;
      });
      customDialog(
        "Error",
        err.msg,
        [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              if (from == "update") Navigator.of(context).pop();
            },
            child: Text("Ok"),
          ),
        ],
        context,
      );
    } catch (err) {
      setState(() {
        _otpLoading = false;
        _gotOTP = true;
      });
      customDialog(
        "Error",
        "Something went wrong. Please check your connection and try again later",
        [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              if (from == "update") Navigator.of(context).pop();
            },
            child: Text("Ok"),
          ),
        ],
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final from = data["from"];
    return Scaffold(
      backgroundColor: _skinColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
                  child: Text(
                    "Update Password",
                    style: TextStyle(
                      color: _borderColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                  child: TextFormField(
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
                        Icons.lock_open,
                        color: Colors.black,
                      ),
                      labelText: "New Password",
                      hintText: "Enter your New Password",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
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
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _newP = !_newP;
                          });
                        },
                        child: Icon(
                          _newP ? FontAwesome.eye_slash : FontAwesome.eye,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    obscureText: _newP ? false : true,
                    cursorColor: Colors.black,
                    onSaved: (val) => _userPass["newPass"] = val,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_confirm);
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Please enter a valid password";
                      }
                      if (val.length < 6) {
                        return "Password length must be greater than 6";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                  child: TextFormField(
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
                        Icons.lock_open,
                        color: Colors.black,
                      ),
                      labelText: "Confirm New Password",
                      hintText: "Confirm your New Password",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
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
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _confnewP = !_confnewP;
                          });
                        },
                        child: Icon(
                          _confnewP ? FontAwesome.eye_slash : FontAwesome.eye,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    obscureText: _confnewP ? false : true,
                    focusNode: _confirm,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    onSaved: (val) => _userPass["confirmNewPass"] = val,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_curr);
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Please enter a valid password";
                      }
                      if (val.length < 6) {
                        return "Password length must be greater than 6";
                      }
                      return null;
                    },
                  ),
                ),
                from == "update"
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                        child: TextFormField(
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
                              Icons.lock_open,
                              color: Colors.black,
                            ),
                            labelText: "Current Password",
                            hintText: "Your Current Password",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(
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
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currP = !_currP;
                                });
                              },
                              child: Icon(
                                _currP
                                    ? FontAwesome.eye_slash
                                    : FontAwesome.eye,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          obscureText: _currP ? false : true,
                          focusNode: _curr,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          onSaved: (val) => _userPass["confirmCurrPass"] = val,
                          validator: (val) {
                            final cp = Provider.of<Auth>(context, listen: false)
                                .student;
                            if (cp.password != val) {
                              return "Invalid Password";
                            }
                            return null;
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                        child: TextFormField(
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
                              Icons.lock_open,
                              color: Colors.black,
                            ),
                            labelText: "OTP",
                            hintText: "Enter the OTP",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(
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
                          style: TextStyle(color: Colors.black),
                          onSaved: (val) => _userPass["OTP"] = val,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter a valid OTP";
                            }
                            if (val.length != 12) {
                              return "Please enter a valid OTP";
                            }
                            return null;
                          },
                        ),
                      ),
                _otpLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.black),
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : from == "update"
                        ? Container()
                        : Align(
                            child: RaisedButton(
                              onPressed: _gotOTP ? null : () => _getOtp(from),
                              child: Text("Request OTP"),
                              color: Colors.black,
                              textColor: Colors.white,
                            ),
                          ),
                SizedBox(height: 30),
                _isLoading
                    ? Align(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(130, 0, 0, 20),
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textColor: _borderColor,
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                          ),
                          onPressed: from == "update"
                              ? () => _changePass(from)
                              : _gotOTP ? () => _changePass(from) : null,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Update",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                Divider(
                  thickness: 2,
                  indent: 100,
                  endIndent: 100,
                  color: Colors.teal,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(
                        Icons.info,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Text(
                        "Some important things!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 10, 0, 10),
                  child: Text(
                    " --  Never reveal your password to anyone!",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 10, 0, 10),
                  child: Text(
                    " --  Change your password every fortnight!",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 10, 0, 10),
                  child: Text(
                    " --  Don't ever give others access to your account!",
                    style: TextStyle(fontSize: 16),
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
