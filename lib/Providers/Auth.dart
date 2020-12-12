import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
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
    try {
      final response = await http.post(
        url,
        body: json.encode(userData),
        headers: {"Content-Type": "application/json"},
      );
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
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
    } catch (err) {
      print(err);
    }
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
      url += "recruiter/signip";
      dataUser = {
        "name": userData["name"],
        "email": userData["email"],
        "companyName": userData["company"],
        "position": userData["position"],
        "password": userData["password"],
      };
    }
    try {
      final response = await http.post(
        url,
        body: json.encode(dataUser),
        headers: {"Content-Type": "application/json"},
      );
      final extractedBody = json.decode(response.body) as Map<String, dynamic>;
      final data = extractedBody["data"];
      print(data);
      var s, r;
      if (userData["role"] == "student") {
        s = Student(
          name: data["name"],
          email: data["email"],
          usn: data["usn"],
          sem: data["sem"],
          dept: data["dept"],
          password: userData["password"],
        );
        _suser = s;
      } else {
        r = Recruiter(
          name: data["name"],
          email: data["email"],
          companyName: data["companyName"],
          position: data["position"],
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
    } catch (err) {
      print(err);
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
          password: userData["password"],
        );
      } else {
        _ruser = Recruiter(
          name: data["name"],
          email: data["email"],
          companyName: data["companyName"],
          position: data["position"],
          password: userData["password"],
        );
      }
      _token = data["token"];
      _role = data["role"];
      notifyListeners();
    }

    Future<void> forgotPassword(String usnOremail) async {
      final url =
          "https://placement-stats-test.herokuapp.com/api/v1/auth/forgotpassword";
      var userData = {};
      if (_role == "student") {
        userData = {"usn": usnOremail};
      } else {
        userData = {"email": usnOremail};
      }
      try {
        final response = await http.post(
          url,
          body: json.encode(userData),
          headers: {"Content-Type": "application/json"},
        );
        final extractedBody = json.decode(response.body) as Map<String, dynamic>;
        final data = extractedBody["success"];
        return data;
      } catch (err) {
        print(err);
      }
    }

    Future<void> resetPassword(String otp, String password) async {
      final url =
          "https://placement-stats-test.herokuapp.com/api/v1/auth/resetpassword";
        final userData = {
          "otp": otp,
          "password": password,
          "role": _role
        };
      try {
        final response = await http.post(
          url,
          body: json.encode(userData),
          headers: {"Content-Type": "application/json"},
        );
        final extractedBody = json.decode(response.body) as Map<String, dynamic>;
        final data = extractedBody["success"];
        return data;
      } catch (err) {
        print(err);
      }
    }

    Future<void> updatePassword(String password, String newPassword, String usnOremail) async {
      final url =
          "https://placement-stats-test.herokuapp.com/api/v1/auth/updatepassword";
        if(_role == "student"){
          final userData = {
          "newPassword": newPassword,
          "password": password,
          "usn": usnOremail
        };
        }else{
          final userData = {
          "newPassword": newPassword,
          "password": password,
          "email": usnOremail
        };
        }
      try {
        final response = await http.post(
          url,
          body: json.encode(userData),
          headers: {"Content-Type": "application/json"},
        );
        final extractedBody = json.decode(response.body) as Map<String, dynamic>;
        final data = extractedBody["success"];
        return data;
      } catch (err) {
        print(err);
      }
    }

    Future<void> logout() async {
      final prefs = await SharedPreferences.getInstance();
      _token = null;
      _role = null;
      prefs.clear();
      notifyListeners();
    }
  }
}
