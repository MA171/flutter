import 'package:flutter/material.dart';
import 'View/LoginScreen.dart';
import 'routs.dart';

void main(){
  runApp(
    MainWidget()
  );
}
class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesAll,
      title: "My First App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}

