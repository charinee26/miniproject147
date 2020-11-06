//import 'dart:html';
import 'package:firebasebeam/screens/add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasebeam/screens/edit.dart';
import 'package:flutter/material.dart';

class Home2page extends StatefulWidget {
  @override
  _Home2pageState createState() => _Home2pageState();
}

class _Home2pageState extends State<Home2page> {
  String user;
  String password;
  String name;
  String tel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diary Story")),
      body: realTimestory(),
      backgroundColor: Colors.green[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MaterialPageRoute route1 =
              MaterialPageRoute(builder: (context) => AddPage());
          Navigator.push(context, route1);
        },
        //tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget realTimestory() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("story").snapshots(),
      builder: (context, snapshots) {
        switch (snapshots.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          default:
            return Column(
              children: makeListWidget(snapshots),
            );
        }
      },
    );
  }

  List<Widget> makeListWidget(AsyncSnapshot snapshots) {
    return snapshots.data.docs.map<Widget>((document) {
      return Card(
        //---------ใส่Crad รูปภาพ
        child: ListTile(
          trailing: IconButton(
              //--------trailing คือ เพิ่มข้างหลัง เพื่อไว้ใส่ icon ลบ
              icon: Icon(Icons.delete),
              //----------ปุ่มลบ-----------
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text("ต้องการลบข้อมูลหรือไม่"),
                            )
                          ],
                        ),
                        actions: [
                          FlatButton(
                              child: Text("ลบ"),
                              color: Colors.red,
                              onPressed: () {
                                deletestory(
                                    document.id); //-------ใส่ document id
                                Navigator.of(context).pop();
                              }),
                          FlatButton(
                              child: Text("ยกเลิก"),
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ],
                      );
                    });
              }),
          leading: Container(
            width: 60,
            child: Image.network(
              document['img'],
              fit: BoxFit.cover,
            ),
          ),
          title: Text(document['location_name']),
          subtitle: Text(document['dairy'].toString()),
          onTap: () {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => EditPage(docid: document.id),
            );
            Navigator.push(context, route);
          },
        ),
      );
    }).toList();
  }

  Future<void> deletestory(id) async {
    await FirebaseFirestore.instance.collection("story").doc(id).delete();
  }
}
