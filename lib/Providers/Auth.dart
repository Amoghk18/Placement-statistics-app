import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:placement_stats/Utils/HttpException.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student {
  String name;
  String email;
  String usn;
  String sem;
  String dept;
  String password;

  Student({
    @required this.name,
    @required this.email,
    @required this.usn,
    @required this.sem,
    @required this.dept,
    @required this.password,
  });

  bool get hasUsn {
    return true;
  }
}

class Recruiter {
  String name;
  String email;
  String companyName;
  String position;
  String password;

  Recruiter({
    @required this.name,
    @required this.email,
    @required this.companyName,
    @required this.position,
    @required this.password,
  });

  bool get hasUsn {
    return false;
  }
}

class Auth with ChangeNotifier {
  Student _suser;
  Recruiter _ruser;
  String _token;
  String _role;

  Student get student {
    final s = Student(
      name: _suser.name,
      email: _suser.email,
      usn: _suser.usn,
      sem: _suser.sem,
      dept: _suser.dept,
      password: _suser.password,
    );
    return s;
  }

  Recruiter get recruiter {
    final r = Recruiter(
      name: _ruser.name,
      email: _ruser.email,
      companyName: _ruser.companyName,
      position: _ruser.position,
      password: _ruser.password,
    );
    return r;
  }

  bool get isAuth {
    return _token != null;
  }

  String get role{
    return _role;
  }

  Future<void> saveToSharedPreferences(dynamic user, String role) async {
    final prefs = await SharedPreferences.getInstance();
    var data = {};
    if (role == "student") {
      data = {
        "name": user.name,
        "email": user.email,
        "usn": user.usn,
        "sem": user.sem,
        "dept": user.dept,
        "password": user.password,
        "role": "student",
        "token": _token
      };
    } else {
      data = {
        "name": user.name,
        "email": user.email,
        "companyName": user.companyName,
        "position": user.position,
        "password": user.password,
        "role": "recruiter",
        "token": _token
      };
    }
    final jsonData = json.encode(data);
    prefs.setString("userData", jsonData);
  }

  Future<void> login(String usnOremail, String password, String role) async {
    var url = "https://placement-stats-test.herokuapp.com/api/v1/auth/";
    Map<String, String> userData = {};
    if (role == "student") {
      url += "student/login";
      userData = {"usn": usnOremail, "password": password};
    } else {
      url += "recruiter/login";
      userData = {"email": usnOremail, "password": password};
    }
    final response = await http.post(
      url,
      body: json.encode(userData),
      headers: {"Content-Type": "application/json"},
    );
    final extractedBody = json.decode(response.body) as Map<String, dynamic>;
    var data;
    if (extractedBody["success"]) {
      data = extractedBody["data"];
    } else {
      throw HttpException("Invalid Credentials");
    }
    print(data);
    var s, r;
    if (role == "student") {
      s = Student(
        name: data["name"],
        email: data["email"],
        usn: data["usn"],
        sem: data["sem"],
        dept: data["dept"],
        password: password,
      );
      _suser = s;
    } else {
      r = Recruiter(
        name: data["name"],
        email: data["email"],
        companyName: data["companyName"],
        position: data["position"],
        password: password,
      );
      _ruser = r;
    }
    _token = extractedBody["token"];
    _role = role;
    notifyListeners();
    if (role == "student") {
      saveToSharedPreferences(s, role);
    } else {
      saveToSharedPreferences(r, role);
    }
    print("Done");
  }

  Future<void> signup(Map<String, String> userData) async {
    var url = "https://placement-stats-test.herokuapp.com/api/v1/auth/";
    Map<String, String> dataUser = {};
    if (userData["role"] == "student") {
      url += "student/signup";
      dataUser = {
        "name": userData["name"],
        "email": userData["email"],
        "usn": userData["usn"],
        "sem": userData["sem"],
        "dept": userData["dept"],
        "password": userData["password"],
      };
    } else {
      url += "recruiter/signup";
      dataUser = {
        "name": userData["name"],
        "email": userData["email"],
        "companyName": userData["companyName"],
        "position": userData["position"],
        "password": userData["password"],
      };
    }
    print(dataUser);
    print(url);
    final response = await http.post(
      url,
      body: json.encode(dataUser),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body);
    final extractedBody = json.decode(response.body) as Map<String, dynamic>;
    if (!extractedBody["success"]) {
      throw HttpException(extractedBody["error"]);
    }
    var s, r;
    if (userData["role"] == "student") {
      s = Student(
        name: userData["name"],
        email: userData["email"],
        usn: userData["usn"],
        sem: userData["sem"],
        dept: userData["dept"],
        password: userData["password"],
      );
      _suser = s;
    } else {
      r = Recruiter(
        name: userData["name"],
        email: userData["email"],
        companyName: userData["companyName"],
        position: userData["position"],
        password: userData["password"],
      );
      _ruser = r;
    }
    _token = extractedBody["token"];
    _role = userData["role"];
    notifyListeners();
    if (userData["role"] == "student") {
      saveToSharedPreferences(s, userData["role"]);
    } else {
      saveToSharedPreferences(r, userData["role"]);
    }
    print("Done");
  }

  Future<void> forgotPassword() async {
    final url =
        "https://placement-stats-test.herokuapp.com/api/v1/auth/forgotpassword";
    var userData = {};
    if (_role == "student") {
      userData = {"usn": _suser.usn};
    } else {
      userData = {"email": _ruser.email};
    }
    final response = await http.post(
      url,
      body: json.encode(userData),
      headers: {"Content-Type": "application/json"},
    );
    final extractedBody = json.decode(response.body) as Map<String, dynamic>;
    if (!extractedBody["success"]) {
      throw HttpException(extractedBody["error"]);
    }
  }

  Future<void> resetPassword(String otp, String newPassword) async {
    final url =
        "https://placement-stats-test.herokuapp.com/api/v1/auth/resetpassword";
    var userData = {};
    if(_role == "student"){
      userData = {"otp": otp, "password": newPassword, "role": _role};
    }else{
      userData = {"otp": otp, "password": newPassword, "role": _role};
    }
    final response = await http.post(
      url,
      body: json.encode(userData),
      headers: {"Content-Type": "application/json"},
    );
    final extractedBody = json.decode(response.body) as Map<String, dynamic>;
    if (!extractedBody["success"]) {
      throw HttpException(extractedBody["error"]);
    }
    if(_role == "student"){
      _suser.password = newPassword;
    }else{
      _ruser.password = newPassword;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    if(_role == "student"){
      saveToSharedPreferences(_suser, "student");
    }else{
      saveToSharedPreferences(_ruser, "recruiter");
    }
  }

  Future<void> updatePassword(String password, String newPassword) async {
    final url =
        "https://placement-stats-test.herokuapp.com/api/v1/auth/updatepassword";
    var userData = {};
    if (_role == "student") {
      userData = {
        "newPassword": newPassword,
        "password": password,
        "usn": _suser.usn
      };
    } else {
      userData = {
        "newPassword": newPassword,
        "password": password,
        "email": _ruser.email
      };
    }
    final response = await http.put(
      url,
      body: json.encode(userData),
      headers: {"Content-Type": "application/json"},
    );
    final extractedBody = json.decode(response.body) as Map<String, dynamic>;
    if (!extractedBody["success"]) {
      throw HttpException(extractedBody["error"]);
    }
    if(_role == "student"){
      _suser.password = newPassword;
    }else{
      _ruser.password = newPassword;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    if(_role == "student"){
      saveToSharedPreferences(_suser, "student");
    }else{
      saveToSharedPreferences(_ruser, "recruiter");
    }
  }

  Future<void> updateProfile(Map<String, String> m) async {
    final url =
        "https://placement-stats-test.herokuapp.com/api/v1/auth/updateprofile";
    var userData = {};
    if (m["role"] == "student") {
      userData = {
        "name": m["name"],
        "email": m["email"],
        "sem": m["sem"],
        "dept": m["dept"],
        "usn": _suser.usn
      };
    } else {
      userData = {
        "name": m["name"],
        "newEmail": m["email"],
        "companyName": m["companyName"],
        "position": m["position"],
        "email": _ruser.email
      };
    }

    final response = await http.put(
      url,
      body: json.encode(userData),
      headers: {"Content-Type": "application/json"},
    );
    final extractedBody = json.decode(response.body) as Map<String, dynamic>;
    if (!extractedBody["success"]) {
      throw HttpException(extractedBody["error"]);
    }
    var s, r;
    final data = extractedBody["token"];
    if (_role == "student") {
      s = Student(
        name: data["name"],
        email: data["email"],
        usn: data["usn"],
        sem: data["sem"],
        dept: data["dept"],
        password: _suser.password,
      );
      _suser = s;
    } else {
      r = Recruiter(
        name: data["name"],
        email: data["email"],
        companyName: data["companyName"],
        position: data["position"],
        password: _ruser.password,
      );
      _ruser = r;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    if(_role == "student"){
      saveToSharedPreferences(s, "student");
    }else{
      saveToSharedPreferences(r, "recruiter");
    }
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("userData")) {
      return;
    }
    final jsonData = prefs.getString("userData");
    final data = json.decode(jsonData);
    if (data["role"] == "student") {
      _suser = Student(
        name: data["name"],
        email: data["email"],
        usn: data["usn"],
        sem: data["sem"],
        dept: data["dept"],
        password: data["password"],
      );
    } else {
      _ruser = Recruiter(
        name: data["name"],
        email: data["email"],
        companyName: data["companyName"],
        position: data["position"],
        password: data["password"],
      );
    }
    _token = data["token"];
    _role = data["role"];
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    _token = null;
    _role = null;
    prefs.clear();
    notifyListeners();
  }
}
