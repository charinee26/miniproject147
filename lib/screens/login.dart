import 'package:firebasebeam/screens/authen.dart';
import 'package:firebasebeam/screens/hom.dart';
// import 'package:firebasebeam/screens/home.dart';
import 'package:firebasebeam/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class Login extends StatefulWidget {
  final String title;
  const Login({Key key, this.title}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration( 
            // color: Color.fromRGBO(15, 76, 129, 1),
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.yellow[50],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      MyStyle.showLogo(),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 0),
                      // ),
                      GoogleSignInButton(
                        onPressed: () => signInwithGoogle().then((value) {
                          if (value != null) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => Myhomepage(),
                                ),
                                (route) => false);
                          }
                        }),
                      ),
                    ],
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
