import 'package:flutter/material.dart';

class Nothing extends StatefulWidget {
  @override
  _NothingState createState() => _NothingState();
}

class _NothingState extends State<Nothing> {

  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;

  int RadioValue = -1;

  String ListValue = "Amman";

  void onChangeRadio(int value){
    setState(() {
      RadioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            CheckboxListTile(
                value: checkBox1,
                onChanged: (bool val){
                  setState(() {
                    checkBox1 = val;
                  });
                },
              title: Text("Check1"),
              subtitle: Text("Sub1"),
              secondary: Icon(Icons.archive),
              activeColor: Colors.blue,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              value: checkBox2,
              onChanged: (bool val){
                setState(() {
                  checkBox2 = val;
                });
              },
              title: Text("Check1"),
              subtitle: Text("Sub1"),
              secondary: Icon(Icons.archive),
              activeColor: Colors.blue,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              value: checkBox3,
              onChanged: (bool val){
                setState(() {
                  checkBox3 = val;
                });
              },
              title: Text("Check1"),
              subtitle: Text("Sub1"),
              secondary: Icon(Icons.archive),
              activeColor: Colors.blue,
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("List1"),
                Radio(
                    value: 0,
                    groupValue: RadioValue,
                    onChanged: onChangeRadio,
                ),

              ],
            ),
            Column(
              children: <Widget>[
                Radio(
                    value: 1,
                    groupValue: RadioValue,
                    onChanged: onChangeRadio
                )
              ],
            ),
            Column(
              children: <Widget>[
                Radio(
                    value: 2,
                    groupValue: RadioValue,
                    onChanged: onChangeRadio
                )
              ],
            ),
          ],
        ),
        RadioListTile(
            value: 3,
            groupValue: RadioValue,
            onChanged: onChangeRadio,
            title: Text("Radio 1"),
            secondary: Icon(Icons.check),
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
      ],
    );
  }
}
