import 'package:agriser/screens/providers/prov_profile.dart';
import 'package:agriser/screens/users/all_user_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../home.dart';
import '../login.dart';
import 'all_prov_page.dart';

final userRef = FirebaseFirestore.instance.collection("Users");

class Menu_prov_bar extends StatefulWidget {
  @override
  _Menu_prov_barState createState() => _Menu_prov_barState();
}

class _Menu_prov_barState extends State<Menu_prov_bar> {
  String login;
  var id;

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  readdata() async {
    print("Read DATA " + id);
    DocumentSnapshot doc = await userRef.doc(id).get();
    Map<String, dynamic> mapEventData = doc.data();
    // print(doc.id);
    // print(doc.exists);
    // print(mapEventData['name']);
    setState(() {
      login = mapEventData['name'];
    });

    // userRef.doc("PFpZDAMsqab4PCVYN9T0a9EIN1D3").get().then((DocumentSnapshot doc) {
    //     Map<String, dynamic> mapEventData = doc.data();
    //     print(doc.id);
    //     print(doc.exists);
    //     print(mapEventData);
    // });
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

  Future<void> processSignOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Login());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('คุณแน่ใจ ?'),
            content: Text('คุณต้องการออกจากระบบใช่หรือไม่'),
            actions: <Widget>[cancelButton(), okButton()],
          );
        });
  }

  Widget okButton() {
    return FlatButton(
      child: Text('ตกลง'),
      onPressed: () {
         Navigator.of(context).pop(); 
        processSignOut();
      },
    );
  }

  Widget cancelButton() {
    return FlatButton(
      child: Text('ยกเลิก'),
      onPressed: () {
        Navigator.of(context).pop();     },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          color: Colors.green,
          child: Center(
            child: Column(children: <Widget>[
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://picsum.photos/250?image=9",
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Text("$login", style: TextStyle(fontSize: 22.0))
            ]),
          ),
        ),
        ListTile(
          leading: Icon(Icons.swap_horizontal_circle),
          title: Text(
            "เข้าสู่สถานะผู้ใช้",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => All_user_page(),
              ),
              (route) => false,
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.perm_contact_calendar),
          title: Text(
            "แก้ไขข้อมูลผู้ให้บริการ",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "แก้ไขข้อมูลส่วนตัว",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onTap: () {
            MaterialPageRoute sign_in = MaterialPageRoute(
                builder: (BuildContext context) => Prov_editprofile());
            Navigator.of(context).push(sign_in);
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text(
            "ออกจากระบบ",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onTap: () {
            myAlert();
          },
        ),
      ],
    ));
  }
}
