import 'package:flutter/material.dart';
import 'package:myfirstapp/routs.dart';

class SignupScreen extends StatefulWidget {
  int value;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  @override

  static var _emailController = TextEditingController();
  static var _passController = TextEditingController();


  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/m.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            color: Colors.lightBlue.withOpacity(0.9),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(Icons.supervised_user_circle, color: Colors.white,size: 150.0,),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                            child: Icon(Icons.accessibility, color: Colors.white,)
                        ),
                        Expanded(
                            child: TextField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Name",
                                    hintStyle: TextStyle(color: Colors.white)
                                )
                            ))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                            child: Icon(Icons.phone_android, color: Colors.white,)
                        ),
                        Expanded(
                            child: TextField(

                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Phone",
                                    hintStyle: TextStyle(color: Colors.white)
                                )
                            ))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                            child: Icon(Icons.email, color: Colors.white,)
                        ),
                        Expanded(
                            child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Email",
                                    hintStyle: TextStyle(color: Colors.white)
                                )
                            ))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                            child: Icon(Icons.security, color: Colors.white,)
                        ),
                        Expanded(child: TextField(
                            controller: _passController,
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Your Password",
                                hintStyle: TextStyle(color: Colors.white)
                            )
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            splashColor: Colors.blue,
                            color: Colors.white,
                            child: Text("Sign up"),
                            onPressed: (){

                              setState(() {
                                data.loginInfo['email'] = _emailController.text;
                                data.loginInfo['pass'] = _passController.text;
                              });

                            }
                        ),
                        FlatButton(
                          splashColor: Colors.white,
                          child: Text("or Login"),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }}
