import 'package:agriser/screens/users/all_user_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String email, pass, name, phone;

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((response) {
      addData(email, pass, name, phone, "user");
      print("Register Success Email = $email");

      // setupDisplayName();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => All_user_page(),
        ),
        (route) => false,
      );
     
    }
    
    ).catchError((response) {
      String title = response.code;
      String message = response.message;
      print("title = $title, message = $message");
      myAlert(title, message);
    });
  }

  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    var user = firebaseAuth.currentUser;

    // if (user != null) {
    //   user.updateProfile(displayName: name);

    //   MaterialPageRoute materialPageRoute =
    //       MaterialPageRoute(builder: (BuildContext context) => ());
    //   Navigator.of(context).pushAndRemoveUntil(
    //       materialPageRoute, (Route<dynamic> route) => false);
    // }
  }

  Future<void> addData(String email, String pass, String name, String phone,
      String status) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Users");
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    collectionReference.doc(uid).set({
      "email": email,
      "pass": pass,
      "name": name,
      "phone": phone,
      "status": status,
      "uid": uid,
    });
    return;
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.add_alert,
                color: Colors.red,
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.red),
              ),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
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
          pass = value.trim();
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
            
            registerThread();
            // return SpinKitRing(color: Colors.blue);
            
          }
        },
      ),
    );
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
}
