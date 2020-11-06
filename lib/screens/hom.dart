import 'package:firebasebeam/screens/home.dart';
import 'package:firebasebeam/screens/home2.dart';
import 'package:firebasebeam/screens/search.dart';
import 'package:firebasebeam/utils/style.dart';
import 'package:flutter/material.dart';

class Myhomepage extends StatefulWidget {
  final String title;
  const Myhomepage({Key key, this.title}) : super(key: key);

  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  bool isSearching = false;
  String user;
  String password;
  String name;
  String tel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title:title,
      home: Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? Text("story")
              : TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search story",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          actions: <Widget>[
            isSearching
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                    },
                    icon: Icon(Icons.cancel),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    },
                    icon: Icon(Icons.search),
                  )
          ],
        ),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),

          MyStyle.showmountain(),
          FlatButton(
            // height: 50,
            child: Text('mountain'),
            onPressed: () {
              MaterialPageRoute route = MaterialPageRoute(
                builder: (context) => Homepage(),
              );
              Navigator.push(context, route);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.green,
            textColor: Colors.white,
          ),
          const Divider(
            color: Colors.black26,
            height: 20,
            thickness: 0,
            indent: 20,
            endIndent: 20,
          ),

          MyStyle.showwaterfall(),
          FlatButton(
            // height: 50,
            child: Text('waterfall'),
            onPressed: () {
              MaterialPageRoute route = MaterialPageRoute(
                builder: (context) => Home2page(),
              );
              Navigator.push(context, route);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.blue[300],
            textColor: Colors.white,
          ),
          const Divider(
            color: Colors.black26,
            height: 20,
            thickness: 0,
            indent: 20,
            endIndent: 20,
          ),
          MyStyle.showcafe(),
          FlatButton(
            // height: 50,
            child: Text('cafe'),
            onPressed: () {
              MaterialPageRoute route = MaterialPageRoute(
                builder: (context) => SearchPage(),
              );
              Navigator.push(context, route);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.orange[300],
            textColor: Colors.white,
          ),
          const Divider(
            color: Colors.black26,
            height: 20,
            thickness: 0,
            indent: 20,
            endIndent: 20,
          ),
          // MyStyle.showsea(),
          // FlatButton(
          //   // height: 50,
          //   child: Text('wsea'),
          //   onPressed: () {},
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          //   color: Colors.purple[200],
          //   textColor: Colors.white,
          // ),
          // const Divider(
          //   color: Colors.black26,
          //   height: 20,
          //   thickness: 0,
          //   indent: 20,
          //   endIndent: 20,
          // ),
        ],
      ),
    );
  }
}
