import 'package:agriser/widgets/user/drawer_layout1.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agriser/widgets/user/drawer_layout1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agriser/bloc/user/drawer_bloc1.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileUser extends StatefulWidget {
  @override
  _EditProfileUserState createState() => _EditProfileUserState();
}

class _EditProfileUserState extends State<EditProfileUser> {
  
  final userRef = FirebaseFirestore.instance.collection("Users");

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }
final formKey = GlobalKey<FormState>();
  String name, email, pass, phone, address_no, address_subdistrict, address_district, address_province, address_postal;
  
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ลงทะเบียนทั่วไป",
          style: GoogleFonts.mitr(fontSize: 20),
        ),
        backgroundColor: Colors.yellow.shade900,
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
              passwordText(),
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
      autofocus: true,
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
          if (value.length < 6) {
            return "กรุณาใส่รหัสผ่านอย่างน้อย 6 ตัว";
          } else {
            return null;
          }
        },
        onSaved: (String value) {
         
        },
        obscureText: true);
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person_outline,
          size: 30,
        ),
        labelText: "ชื่อ-นามสกุล",
        labelStyle: GoogleFonts.mitr(fontSize: 24),
      ),
      onSaved: (String value) {
        name = value.trim();
      },
    );
  }

  Widget phoneText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          size: 30,
        ),
        labelText: "เบอร์โทรศัพท์",
        labelStyle: GoogleFonts.mitr(fontSize: 24),
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
        labelStyle: GoogleFonts.mitr(fontSize: 20),
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
        labelStyle: GoogleFonts.mitr(fontSize: 20),
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
        labelStyle: GoogleFonts.mitr(fontSize: 20),
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
        labelStyle: GoogleFonts.mitr(fontSize: 20),
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
        labelStyle: GoogleFonts.mitr(fontSize: 20),
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
        color: Colors.blue.shade700,
        child: Text(
          "ถัดไป",
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
