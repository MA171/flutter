import 'package:flutter/material.dart';
import 'View/LoginScreen.dart';
import 'View/SignupScreen.dart';
import 'View/HomeScreen.dart';
import 'View/AddStudentScreen.dart';

final RoutesAll = <String,WidgetBuilder>{
  '/Login': (BuildContext context) => LoginScreen(),
  '/Signup': (BuildContext context) => SignupScreen(),
  '/Home': (BuildContext context) => HomeScreen(),
  '/AddStudent': (BuildContext context) => AddStudentScreen(),
};

class data{
  static var loginInfo = <String,String> {
    'email': '',
    'password': ''
  };
}