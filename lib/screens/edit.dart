import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final String docid;

  const EditPage({Key key, this.docid}) : super(key: key);
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _location_name = TextEditingController();
  TextEditingController _dairy = TextEditingController();
  TextEditingController _typecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    // var _foodcontroller1;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit story"),
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
              child: TextField(
                controller: _dairy,
                decoration: InputDecoration(labelText: 'Dairy(ความประทับใจ)'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _typecontroller,
                decoration: InputDecoration(labelText: 'ประเภท'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            RaisedButton(
              onPressed: () {
                updateGear();
              },
              child: Text('บันทึก'),
              color: Colors.purple[100],
            )
          ],
        ),
      ),
    );
  }

  Future<void> getInfo() async {
    await FirebaseFirestore.instance
        .collection("story")
        .doc(widget.docid)
        .get()
        .then((value) {
      setState(() {
        //ค่ามันเปลี่ยนเลยต้อง setstate
        _location_name =
            TextEditingController(text: value.data()['location_name']);
        _dairy = TextEditingController(text: value.data()['dairy'].toString());
        _typecontroller = TextEditingController(text: value.data()['type']);
      });
    });
  }

  Future<void> updateGear() async {
    await FirebaseFirestore.instance
        .collection("story")
        .doc(widget.docid)
        .update({
      'location_name': _location_name.text,
      'dairy': _dairy.text,
      'type': _typecontroller.text,
    }).whenComplete(() => Navigator.pop(context));
  }
}
