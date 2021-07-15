import 'package:agriser/widgets/user/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:agriser/bloc/user/drawer_bloc.dart';
// import 'package:agriser/widgets/custom_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agriser/widgets/user/info_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final userRef = FirebaseFirestore.instance.collection("Users");

class UserProfileScreen extends StatefulWidget with DrawerStates {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
          InfoCard(
            text: '$name',
            icon: Icons.person,
          ),
          InfoCard(
            text: '$email',
            icon: Icons.email,
          ),
          InfoCard(
            text: '$address',
            icon: Icons.home,
          ),
          InfoCard(
            text: '$phone',
            icon: Icons.phone,
          ),
          add_data(),
        ],
      ),
    );
  }

  Widget editimages() {
    return RaisedButton(
      padding: EdgeInsets.only(left: 45, right: 45),
      color: Colors.white,
      onPressed: () {},
      child: Text(
        "เปลี่ยนรูปภาพโปรไฟล์",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget editprofile() {
    return RaisedButton(
      padding: EdgeInsets.only(left: 55, right: 55),
      color: Colors.white,
      onPressed: () {
        Navigator.of(context).pop();
        BlocProvider.of<DrawerBloc>(context)
            .add(DrawerEvents.NotificationEvent);
      },
      child: Text(
        "แก้ไขข้อมูลส่วนตัว",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget add_data() {
    return RaisedButton(
      padding: EdgeInsets.only(left: 49, right: 49),
      color: Colors.white,
      onPressed: () {},
      child: Text(
        "เพิ่มข้อมูลผู้ให้บริการ",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
