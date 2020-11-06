import 'dart:convert';
import 'package:firebasebeam/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String user;
  String pass;
  String response = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // color: Color.fromRGBO(15, 76, 129, 1),
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.yellow[200],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyStyle.showLogo(),
                  Form(
                    key: _formKey,
                    child: Column(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class Login extends StatefulWidget {

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text('Dispen'),
//       ),
//      body: Center(

//        child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//              Padding(padding: EdgeInsets.only(top:30),), //ระยะรูปภาพ
//           Image.asset("img/am.png"),
//            Padding(padding: EdgeInsets.only(top:30),),
//            Text('PILL DISPENSER', style: TextStyle(fontSize: 20),),
//             Padding(padding: EdgeInsets.only(top:100),),

//      GoogleSignInButton(
//          borderRadius: 10,
//         onPressed: () => signInwithGoogle().then((value) {
//           if(value!=null){
//             Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute( builder: (context)=>HomePage()
//               ),
//                (route) => false);
//           }
//         })
//         ),
//           ],

// ),
