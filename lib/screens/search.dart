import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasebeam/screens/edit.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearching = false;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: realto(),
    );
  }

  realto() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("story")
          .where('type', isEqualTo: 'ภูเขา')
          .snapshots(),
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
        child: ListTile(
          leading: Container(
              width: 100,
              child: Image.network(
                document['img'],
                fit: BoxFit.cover,
              )),
          title: Text(document['location_name']),
          subtitle: Text(document['type'].toString()),
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
}
