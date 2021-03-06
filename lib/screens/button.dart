import 'package:firebasebeam/screens/add.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => AddPage(),
            );
            Navigator.push(context, route);
          },
          icon: Icon(Icons.add),
          label: Text('EXTENDED'),
        ),
      ),
    );
  }
}
