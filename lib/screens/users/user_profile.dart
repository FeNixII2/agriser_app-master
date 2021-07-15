import 'package:agriser/screens/users/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agriser/widgets/user/drawer_layout.dart';
import 'package:agriser/bloc/user/drawer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

final userRef = FirebaseFirestore.instance.collection("Users");

class User_editprofile extends StatefulWidget {
  @override
  _User_editprofileState createState() => _User_editprofileState();
}

class _User_editprofileState extends State<User_editprofile> {
  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  
  var id;

  readdata() async {
    print("Read DATA " + id);
    DocumentSnapshot doc = await userRef.doc(id).get();
    Map<String, dynamic> mapEventData = doc.data();
    setState(() {
      name = mapEventData['name'];
      email = mapEventData['email'];
      phone = mapEventData['phone'];
      
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

  final formKey = GlobalKey<FormState>();
  String name, email, pass, phone, address_no, address_subdistrict, address_district, address_province, address_postal;
  final TextEditingController _textemail = new TextEditingController();
  final TextEditingController _textname = new TextEditingController();
  final TextEditingController _texttel = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textemail.text = email;
    _textname.text = name;
    _texttel.text = phone;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ลงทะเบียนทั่วไป",
          style: GoogleFonts.mitr(fontSize: 20),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[],
      ),
      body: Stack(children: <Widget>[
        Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Text("---------ข้อมูลผู้ใช้---------",
                  style: GoogleFonts.mitr(fontSize: 26),
                  textAlign: TextAlign.center),
              emailText(),
              nameText(),
              phoneText(),
              SizedBox(
                height: 10.0,
              ),
              Text("---------ข้อมูลที่อยู่---------",
                  style: GoogleFonts.mitr(fontSize: 26),
                  textAlign: TextAlign.center),
              address_NoText(),
              address_subdistrictText(),
              address_districtText(),
              address_provinceText(),
              address_postalText(),
              SizedBox(
                height: 10.0,
              ),
              nextbutton(),
            ],
          ),
        ),
      ]),
    );
  }

Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _textemail,
      style: GoogleFonts.mitr(fontSize: 20),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          size: 30,
        ),
        
        labelText: "อีเมลล์",
        labelStyle: GoogleFonts.mitr(fontSize: 18),
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
      controller: _textname,
      style: GoogleFonts.mitr(fontSize: 20),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person_outline,
          size: 30,
        ),
        labelText: "ชื่อ-นามสกุล",
        labelStyle: GoogleFonts.mitr(fontSize: 18),
      ),
      onSaved: (String value) {
        name = value.trim();
      },
    );
  }

  Widget phoneText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _texttel,
      style: GoogleFonts.mitr(fontSize: 20),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          size: 30,
        ),
        labelText: "เบอร์โทรศัพท์",
        labelStyle: GoogleFonts.mitr(fontSize: 18),
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

  Widget address_NoText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "บ้านเลขที่",
        labelStyle: GoogleFonts.mitr(fontSize: 18),
      ),
      validator: (String value) {},
      onSaved: (String value) {
        phone = value.trim();
      },
    );
  }

  Widget address_subdistrictText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "ตำบล",
        labelStyle: GoogleFonts.mitr(fontSize: 18),
      ),
      validator: (String value) {},
      onSaved: (String value) {
        phone = value.trim();
      },
    );
  }

  Widget address_districtText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "อำเภอ",
        labelStyle: GoogleFonts.mitr(fontSize: 18),
      ),
      validator: (String value) {},
      onSaved: (String value) {
        phone = value.trim();
      },
    );
  }

  Widget address_provinceText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "จังหวัด",
        labelStyle: GoogleFonts.mitr(fontSize: 18),
      ),
      validator: (String value) {},
      onSaved: (String value) {
        phone = value.trim();
      },
    );
  }

  Widget address_postalText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "รหัสไปรษณีย์",
        labelStyle: GoogleFonts.mitr(fontSize: 18),
      ),
      validator: (String value) {},
      onSaved: (String value) {
        phone = value.trim();
      },
    );
  }

  Widget nextbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      height: 75,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "แก้ไขข้อมูล",
          style: GoogleFonts.mitr(fontSize: 30, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          print("#ถัดไป");
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print(
                "email = $email, pass = $pass, name = $name, phone =  $phone");
            // registerThread();
            
          }
        },
      ),
    );
  }
}
