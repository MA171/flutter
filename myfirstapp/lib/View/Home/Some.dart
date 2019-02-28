import 'package:flutter/material.dart';
import 'package:myfirstapp/Model/Student.dart';
import 'package:myfirstapp/Control/DBHelper.dart';

class Some extends StatefulWidget {
  @override
  _SomeState createState() => _SomeState();
}

class _SomeState extends State<Some> {
  @override

  final userData = [
    "Ahmad",
    "Mahmoud",
    "Samer",
    "Khalid",
    "Zaid",
    "Marwa",
    "Tala",
    "Bashar",
    "Lamar",
    "Najjar",
    "Methqal",
  ];

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Student>>(
        future: DBHelper.db.getAllStudents(),
        builder: (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            print("This is us");
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Student s = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBHelper.db.deleteStudent(s.id);
                  },
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${s.id}", style: TextStyle(fontSize: 20.0),),
                        Text(s.lName, style: TextStyle(fontSize: 20.0),),
                        Text(s.major, style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }

  /*
    for(int i=0;i<length;i++){

    }
   */
}
