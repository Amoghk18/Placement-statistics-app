import 'package:flutter/material.dart';

class CompanyRegScreen extends StatelessWidget {
  static const String routeName = "/company-reg";

  final _compData = {
    "compName": "",
    "email": "",
    "parentComp": "",
    "estb": "",
    "domain": "",
  };

  final _emailFocus = FocusNode();
  final _parentFocus = FocusNode();
  final _estbFocus = FocusNode();
  final _domainFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  final Color _skinColor = Color(0xffffe9e3);
  final Color _borderColor = Color(0xff681313);

  void _register(BuildContext context) {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    print(_compData);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Success",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
            "We have received your data. To confirm registration please head over to Campus Placement Screen"),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(ctx).pop();
            },
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _skinColor,
      appBar: AppBar(
        backgroundColor: _skinColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        "Register Your Company!",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                            color: _borderColor,
                            wordSpacing: 1.5,
                            letterSpacing: 1.2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
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
                        labelText: "Company Name",
                        hintText: "Name of the Company",
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
                      cursorColor: Colors.black,
                      onSaved: (val) => _compData["compName"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid company name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
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
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "Official Email",
                        hintText: "Official Email ID",
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
                        FocusScope.of(context).requestFocus(_parentFocus);
                      },
                      cursorColor: Colors.black,
                      onSaved: (val) => _compData["email"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid email";
                        }
                        if (!val.contains("@")) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _parentFocus,
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
                        labelText: "Parent Company Name",
                        hintText: "Name of Parent Company",
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
                        FocusScope.of(context).requestFocus(_estbFocus);
                      },
                      cursorColor: Colors.black,
                      onSaved: (val) => _compData["parentComp"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _estbFocus,
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
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "Established",
                        hintText: "Year of Establishment",
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
                        FocusScope.of(context).requestFocus(_domainFocus);
                      },
                      cursorColor: Colors.black,
                      onSaved: (val) => _compData["estb"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 30, 20),
                    child: TextFormField(
                      focusNode: _domainFocus,
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
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "Domain",
                        hintText: "Company Domain",
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
                      onSaved: (val) => _compData["domain"] = val,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter a valid name";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  OutlineButton(
                    onPressed: () => _register(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    textColor: _borderColor,
                    borderSide: BorderSide(style: BorderStyle.none),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
