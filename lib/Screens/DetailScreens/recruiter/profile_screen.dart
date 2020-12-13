import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placement_stats/Providers/Auth.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/forgot_pass.dart';
import 'package:placement_stats/Utils/HttpException.dart';
import 'package:placement_stats/Utils/sfDialog.dart';
import 'package:provider/provider.dart';

class ProfileScreenRecruiter extends StatefulWidget {
  static const String routeName = "/profile-recruiter";

  @override
  _ProfileScreenRecruiterState createState() => _ProfileScreenRecruiterState();
}

class _ProfileScreenRecruiterState extends State<ProfileScreenRecruiter> {
  final _newData = {
    "name": "",
    "companyName": "",
    "email": "",
    "position": "",
    "role": "recruiter"
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final Color _skinColor = Color(0xffffe9e3);
  final Color _borderColor = Color(0xff681313);
  final _formKey = GlobalKey<FormState>();
  final _companyFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _posFocus = FocusNode();
  final _passFocus = FocusNode();
  var _showPassword = false;
  var _isLoading = false;

  String _getAbbrName(String name) {
    final arr = name.split(" ");
    var str = "";
    arr.forEach((e) => str += e[0]);
    return str;
  }

  Widget buildTxt(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          child: Text(
        _getAbbrName(name),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 60,
        ),
      )),
    );
  }

  void _save() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).updateProfile(_newData);
      setState(() {
        _isLoading = false;
      });
      customDialog(
        "Success",
        "Profile was updated successfully!",
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

  @override
  Widget build(BuildContext context) {
    final _userData = Provider.of<Auth>(context, listen: false).recruiter;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.2,
              elevation: 0,
              floating: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: buildTxt(_userData.name),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _skinColor,
                    ),
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Divider(
                                color: Colors.black,
                                indent: 50,
                                endIndent: 50,
                                height: 20,
                                thickness: 2,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(50, 10, 0, 20),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "            Edit Profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 26,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: TextFormField(
                                  initialValue: _userData.name,
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
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
                                      borderSide:
                                          BorderSide(color: _borderColor),
                                      gapPadding: 5,
                                    ),
                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_companyFocus);
                                  },
                                  onSaved: (val) => _newData["name"] = val,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "Please enter a valid name";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: TextFormField(
                                  initialValue: _userData.companyName,
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
                                      Icons.business,
                                      color: Colors.black,
                                    ),
                                    labelText: "Company Name",
                                    hintText: "Name of the Company",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
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
                                      borderSide:
                                          BorderSide(color: _borderColor),
                                      gapPadding: 5,
                                    ),
                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_emailFocus);
                                  },
                                  onSaved: (val) =>
                                      _newData["companyName"] = val,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "Please enter a valid Company Name";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: TextFormField(
                                  initialValue: _userData.email,
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
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
                                      borderSide:
                                          BorderSide(color: _borderColor),
                                      gapPadding: 5,
                                    ),
                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_posFocus);
                                  },
                                  onSaved: (val) => _newData["email"] = val,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "Please enter a valid email id";
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
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: TextFormField(
                                  initialValue: _userData.position,
                                  focusNode: _posFocus,
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
                                    labelText: "Postion",
                                    hintText: "Your Position in the Company",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
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
                                      borderSide:
                                          BorderSide(color: _borderColor),
                                      gapPadding: 5,
                                    ),
                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_passFocus);
                                  },
                                  onSaved: (val) => _newData["position"] = val,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "Please enter a valid Position";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: TextFormField(
                                  focusNode: _passFocus,
                                  obscureText: _showPassword ? false : true,
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
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
                                      borderSide:
                                          BorderSide(color: _borderColor),
                                      gapPadding: 5,
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val != _userData.password) {
                                      return "Invalid Credentials";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Password is required for security purposes.",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          ForgotPasswordRecruiter.routeName,
                                          arguments: {"from": "forgot"},
                                        );
                                      },
                                      child: Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              _isLoading
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
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
                                      textColor: _borderColor,
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        style: BorderStyle.none,
                                      ),
                                      onPressed: _save,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          " Save ",
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                    ),
                              Divider(
                                color: Colors.black,
                                indent: 100,
                                endIndent: 100,
                                height: 30,
                                thickness: 2,
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
