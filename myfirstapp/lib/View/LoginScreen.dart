import 'package:flutter/material.dart';
import 'package:myfirstapp/routs.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  static var _emailText = TextEditingController();
  static var _passwordText = TextEditingController();
  static var textPadding = EdgeInsets.symmetric(
      vertical: 3.0, horizontal: 20.0
  );
  Widget build(BuildContext context) {

    var loginInfo = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.supervised_user_circle,
            color: Colors.white,
            size: 150.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: 7.0,horizontal: 30.0
            ),
            padding: textPadding,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.email),
                ),
                Expanded(
                  child: TextField(
                    controller: _emailText,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration
                      (
                      border: InputBorder.none,
                      hintText: "Enter Email",
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: 7.0,horizontal: 30.0
            ),
            padding: textPadding,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.security),
                ),
                Expanded(
                  child: TextField(
                    controller: _passwordText,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration
                      (
                      border: InputBorder.none,
                      hintText: "Password",
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                splashColor: Colors.purple,
                onPressed: (){
                  _emailText.text = data.loginInfo['email'];
                  _passwordText.text = data.loginInfo['pass'];
                  print("emal is : ${_emailText.text}");
                  print("password is : ${_passwordText.text}");

                  Navigator.of(context).pushNamed("/Home");

                  },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                shape: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/Signup');
                },
                child: Text(
                  "Signup",
                  style: TextStyle(color: Colors.white),
                ),
                shape: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              )
            ],
          )
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/m.jpg"),
                  fit: BoxFit.cover,
              )
            ),
          ),
          loginInfo,
        ],
      ),
    );
  }
}

