import 'package:agriser/screens/providers/prov_profile.dart';
import 'package:agriser/widgets/provider/drawer_layout1.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agriser/widgets/provider/drawer_layout1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agriser/bloc/provider/drawer_bloc1.dart';

class EditProfileProv extends StatefulWidget {
  @override
  _EditProfileProvState createState() => _EditProfileProvState();
}

class _EditProfileProvState extends State<EditProfileProv> {
  final userRef = FirebaseFirestore.instance.collection("Users");

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Profile',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      home: BlocProvider<DrawerBloc>(
        create: (context) => DrawerBloc(),
        child: DrawerLayout1(),
      ),
    );
  }
}
