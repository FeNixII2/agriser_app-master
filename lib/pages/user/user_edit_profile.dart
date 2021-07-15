import 'package:flutter/material.dart';
import 'package:agriser/bloc/user/drawer_bloc1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final userRef = FirebaseFirestore.instance.collection("Users");

class UserEditProfile extends StatefulWidget with DrawerStates {
  @override
  _UserEditProfileState createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  String name, email, phone, address;
  var id;

  readdata() async {
    print("Read DATA " + id);
    DocumentSnapshot doc = await userRef.doc(id).get();
    Map<String, dynamic> mapEventData = doc.data();
    setState(() {
      name = mapEventData['name'];
      email = mapEventData['email'];
      phone = mapEventData['phone'];
      address = mapEventData['address'];
    });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        setState(() {
          id = user.uid;
          readdata();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
      child: Column(
        children: <Widget>[
          nameText(),
          emailText(),
          addressText(),
          phoneText(),
          enable_data(),
        ],
      ),
    );
  }

  Widget enable_data() {
    return RaisedButton(
      padding: EdgeInsets.only(left: 49, right: 49),
      color: Colors.white,
      onPressed: () {},
      child: Text(
        "ยืนยันการแก้ไขข้อมูล",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      style: TextStyle(color: Color(0xFFbdc6cf)),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          color: Colors.white,
        ),
        labelText: "อีเมลล์ : ",
        labelStyle: TextStyle(color: Colors.white),
        helperText: "กรอกอีเมลล์",
        helperStyle:
            TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
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

  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        icon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        labelText: "ชื่อ-นามสุกล : ",
        labelStyle: TextStyle(color: Colors.white),
        helperText: "กรอกชื่อและนามสกุล",
        helperStyle:
            TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
      ),
      onSaved: (String value) {
        name = value.trim();
      },
    );
  }

  Widget phoneText() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(
          Icons.phone,
          color: Colors.white,
        ),
        labelText: "เบอร์โทรศัพท์ : ",
        labelStyle: TextStyle(color: Colors.white),
        helperText: "กรอกเบอร์โทรศัพท์",
        helperStyle:
            TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
      ),
      validator: (String value) {
        if (value.length > 15) {
          return "ใส่เบอร์เยอะเกินไป";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        phone = value.trim();
      },
    );
  }

  Widget addressText() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        labelText: "ที่อยู่ : ",
        labelStyle: TextStyle(color: Colors.white),
        helperText: "กรอกที่อยู่อาศัย",
        helperStyle:
            TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
      ),
      onSaved: (String value) {
        address = value.trim();
      },
    );
  }
}
