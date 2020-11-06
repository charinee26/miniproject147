import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class Add2Page extends StatefulWidget {
  final String docid;

  const Add2Page({Key key, this.docid}) : super(key: key);

  @override
  _Add2PageState createState() => _Add2PageState();
}

class _Add2PageState extends State<Add2Page> {
  TextEditingController _location_name = TextEditingController();
  TextEditingController _dairy = TextEditingController();
  TextEditingController _typecontroller = TextEditingController();
  File _image;
  final picker = ImagePicker();

  Future<void> chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddDairy'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _location_name,
                decoration: InputDecoration(labelText: 'ชื่อสถานที่'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              width: 200,
              child: RaisedButton(
                onPressed: () {
                  chooseImage();
                },
                child: Text('เลือกรูป'),
                color: Colors.purple[100],
              ),
            ),
            Container(
              width: 200,
              height: 200,
              child: _image == null ? Text('no image') : Image.file(_image),
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _dairy,
                decoration: InputDecoration(labelText: 'Dairy(ความประทับใจ)'),
              ),
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _typecontroller,
                decoration: InputDecoration(labelText: 'ประเภท'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            RaisedButton(
              onPressed: () {
                addCosmetic();
              },
              //ปุ่ม button บันทึกการแก้ไขข้อมูล
              child: Text('UPLOAD'),
              color: Colors.green[200],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addCosmetic() async {
    String fileName = Path.basename(_image.path);
    StorageReference reference =
        FirebaseStorage.instance.ref().child('$fileName');
    StorageUploadTask storageUploadTask = reference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then((value) async {
      await FirebaseFirestore.instance.collection('story').add({
        'location_name': _location_name.text,
        'dairy': _dairy.text,
        'img': value,
        'type': _typecontroller.text,
      });
    });
  }

  List<void> makeListWidget(AsyncSnapshot snapshots) {
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
        ),
      );
    }).toList();
  }
}
