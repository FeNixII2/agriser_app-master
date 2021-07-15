

import 'package:agriser/screens/register.dart';
import 'package:agriser/screens/users/all_user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void innitState() {
  //   super.initState();
  //   checkStatus();
  // }

  // Future<void> checkStatus() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   var user = firebaseAuth.currentUser;
  //   FirebaseUser firebaseUser = await user;
  //   if (firebaseUser != null) {
  //     MaterialPageRoute materialPageRoute =
  //         MaterialPageRoute(builder: (BuildContext context) => All_user_page());
  //     Navigator.of(context).pushAndRemoveUntil(
  //         materialPageRoute, (Route<dynamic> route) => false);
  //   }
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print("UID User IS : "+user.uid);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => All_user_page()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  Widget showlogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset("images/logo.png"),
    );
  }

  Widget signinbutton() {
    return RaisedButton(
      color: Colors.blue.shade700,
      child: Text(
        "เข้าสู่ระบบ",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        print("You Click Sign In");
        MaterialPageRoute sign_in =
            MaterialPageRoute(builder: (BuildContext context) => Login());
        Navigator.of(context).push(sign_in);
      },
    );
  }

  Widget signupbutton() {
    return OutlineButton(
      child: Text("ลงทะเบียน"),
      onPressed: () {
        print("You Click Sign Up");
        MaterialPageRoute sign_up =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(sign_up);
      },
    );
  }

  Widget showbutton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signinbutton(),
        SizedBox(
          width: 6.0,
        ),
        signupbutton(),
      ],
    );
  }

  Widget showappname() {
    return Text(
      "AS Application",
      style: TextStyle(
        fontSize: 25.0,
        color: Colors.blue.shade700,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  
    
    Scaffold(
      
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showlogo(),
              showappname(),
              SizedBox(
                height: 20.0,
              ),
              showbutton(),
            ],
          ),
        ),
      ),
    );
    
  }
  
}
