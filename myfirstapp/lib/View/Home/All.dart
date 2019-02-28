import 'package:flutter/material.dart';

class All extends StatefulWidget {
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: ListView(
        children: <Widget>[
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "C1",
                  style: TextStyle(fontSize: 60.0),
                ),
                InkWell(
                  child: Icon(Icons.message, size: 50.0,),
                  onTap: (){
                    Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("SDF"),
                        )
                    );

                  },
                ),
              ],
            ),
          ),
          Card(
            child: Text(
              "C1",
              style: TextStyle(fontSize: 60.0),
            ),
          ),
          Card(
            child: Text(
              "C1",
              style: TextStyle(fontSize: 60.0),
            ),
          ),
        ],
      ),
    );
  }
}

