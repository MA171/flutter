import 'package:flutter/material.dart';
import 'package:myfirstapp/View/Home/All.dart';
import 'package:myfirstapp/View/Home/Some.dart';
import 'package:myfirstapp/View/Home/Nothing.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final _homePageScreens = [
    All(),
    Some(),
    Nothing()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Home Screen"),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Center(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Zaid"),
                accountEmail: Text("Zaid@asu.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    "ZD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                title: Text("My Orders"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                color: Colors.black,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: InkWell(
                    child: Text(
                        "Pol",
                    ),
                    onTap: () {
                      print("Pol pressed");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("End Drawer"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.email),
              title: Text("All")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive), title: Text("Some")),
          BottomNavigationBarItem(
              icon: Icon(Icons.print), title: Text("Nothing")),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/AddStudent");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:_homePageScreens[_currentIndex],
    );
  }
}
