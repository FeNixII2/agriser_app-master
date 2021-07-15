import 'package:agriser/screens/home.dart';
import 'package:agriser/screens/register.dart';

import 'package:agriser/screens/users/all_user_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print("UID User IS : " + user.uid);
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

  final formKey = GlobalKey<FormState>();
  String email, pass;

  Future<void> checkIdPass() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((response) {
      print('Sucess');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => All_user_page());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      myAlertErrorLogin(title, message);
    });
  }

  void myAlertErrorLogin(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: showTitle(title),
            content: Text(message),
            actions: <Widget>[okButton()],
          );
        });
  }

  Widget showTitle(String title) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 48.00,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 18.00,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget okButton() {
    return FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('OK'));
  }

  Widget showlogo() {
    return Container(
      width: 190.0,
      height: 190.0,
      child: Image.asset("images/logo.png"),
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          size: 30,
        ),
        labelText: "อีเมลล์",
        labelStyle: GoogleFonts.mitr(fontSize: 24),
      ),
      validator: (String value) {
        if (!((value.contains("@")) && (value.contains(".")))) {
          return "กรุณากรอกอีเมลล์ เช่น abc@gmail.com";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        email = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            size: 30,
          ),
          labelText: "รหัสผ่าน",
          labelStyle: GoogleFonts.mitr(fontSize: 24),
        ),
        validator: (String value) {
          GoogleFonts.mitr(fontSize: 24);
          if (value.length < 6) {
            return "กรุณาใส่รหัสผ่านอย่างน้อย 6 ตัว";
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          pass = value.trim();
        },
        obscureText: true);
  }

  Widget loginbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      height: 60,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "เข้าสู่ระบบ",
          style: GoogleFonts.mitr(fontSize: 30, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          print("#เข้าสู่ระบบ");
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            checkIdPass();
          }
        },
      ),
    );
  }

  Widget facebookbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      height: 60,
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          "เข้าสู่ระบบด้วย Facebook",
          style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget googlebutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      height: 60,
      child: RaisedButton(
        color: Colors.yellow.shade900,
        child: Text(
          "เข้าสู่ระบบด้วย Google+",
          style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showtext() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new GestureDetector(
                onTap: () {
                  print("#ลืมรหัสผ่าน");
                },
                child: new Text(
                  "ลืมรหัสผ่าน",
                  style: GoogleFonts.mitr(
                      fontSize: 22, decoration: TextDecoration.underline),
                 
                ),
              ),
              
        SizedBox(
          width: 22.0,
        ),
       new GestureDetector(
                onTap: () {
                  print("#กดลงทะเบียน");
                  MaterialPageRoute sign_up = MaterialPageRoute(
                      builder: (BuildContext context) => Register());
                  Navigator.of(context).push(sign_up);
                },
                child: new Text(
                  "ลงทะเบียน",
                  style: GoogleFonts.mitr(
                      fontSize: 22, decoration: TextDecoration.underline),
                  
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              showlogo(),
              Text("เกษตรบริการ",
                  style: GoogleFonts.mitr(fontSize: 36),
                  textAlign: TextAlign.center),
              emailText(),
              passwordText(),
              SizedBox(
                height: 8.0,
              ),
              showtext(),
              SizedBox(
                height: 8.0,
              ),
              loginbutton(),
              facebookbutton(),
              googlebutton(),
            ],
          ),
        ),
      ]),
    );
  }
}
