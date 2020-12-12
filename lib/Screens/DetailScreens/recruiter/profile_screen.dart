import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:placement_stats/Screens/DetailScreens/recruiter/forgot_pass.dart';

class ProfileScreenRecruiter extends StatefulWidget {
  static const String routeName = "/profile-recruiter";

  @override
  _ProfileScreenRecruiterState createState() => _ProfileScreenRecruiterState();
}

class _ProfileScreenRecruiterState extends State<ProfileScreenRecruiter> {
  final _userData = {
    "name": "Abc xyz",
    "company": "Abx Xyz",
    "email": "abc@xyz.com",
    "position": "abcxyz",
    "password": "",
  };

  @override
  void initState() {
    super.initState();
  }

  var b = true;

  final Color _skinColor = Color(0xffffe9e3);
  final Color _borderColor = Color(0xff681313);
  final _formKey = GlobalKey<FormState>();
  final _companyFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _posFocus = FocusNode();
  final _passFocus = FocusNode();
  var _showPassword = false;

  Widget buildImg() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(8, 45, 8, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/images/chart.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTxt() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          child: Text(
        "RN",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 60,
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.45,
              title: Text("Edit Profile"),
              elevation: 0,
              floating: true,
              backgroundColor: b ? Colors.white : Theme.of(context).primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: b ? buildImg() : buildTxt(),
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
                                  initialValue: _userData["name"],
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
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: TextFormField(
                                  initialValue: _userData["company"],
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
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: TextFormField(
                                  initialValue: _userData["email"],
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
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 30, 20),
                                child: TextFormField(
                                  initialValue: _userData["position"],
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
                                  onSaved: (val) => _userData["position"] = val,
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
                              OutlineButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                textColor: _borderColor,
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  style: BorderStyle.none,
                                ),
                                onPressed: () {},
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
