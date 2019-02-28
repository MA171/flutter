import 'package:flutter/material.dart';
import 'package:myfirstapp/Model/Student.dart';
import 'package:myfirstapp/Control/DBHelper.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  static var id = TextEditingController();
  static var fName = TextEditingController();
  static var lName = TextEditingController();
  String major = "SE";
  static var phone = TextEditingController();

  String ListValue = "Amman";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
        centerTitle: true,
        elevation: 0,
      ),
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
            color: Colors.purple.withOpacity(0.9),
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
                                controller: id,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Id",
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
                              controller: fName,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your First Name",
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
                                controller: lName,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Last Name",
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
                            controller: phone,
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
                  DropdownButton(
                      value: ListValue,
                      items: [
                        DropdownMenuItem(
                          child: Text("Amman"),
                          value: "Amman",
                        ),
                        DropdownMenuItem(
                          child: Text("Zarqa"),
                          value: "Zarqa",
                        ),
                        DropdownMenuItem(
                          child: Text("Istanbul"),
                          value: "Istanbul",
                        ),
                      ],
                      onChanged: (String value){
                        setState(() {
                          ListValue = value;
                        });
                      }
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
                            child: Text("Add"),
                            onPressed: () async{
                              String Fname = fName.text;
                              String Lname = lName.text;
                              String Phone = phone.text;
                              int ID = int.parse(id.text);
                              Student s = new Student(
                                  fName: Fname,
                                  id: ID,
                                  lName: Lname,
                                  major: major,
                                  phone: Phone
                              );
                              await DBHelper.db.newStudent(s);

                              setState(() {
                                fName.text = "";
                                lName.text = "";
                                phone.text = "";
                                id.text = "";
                              });
                            }
                        ),
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
  }
}
