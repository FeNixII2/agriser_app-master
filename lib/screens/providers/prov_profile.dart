import 'package:agriser/screens/providers/prov_profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agriser/widgets/provider/drawer_layout.dart';
import 'package:agriser/bloc/provider/drawer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agriser/bloc/provider/drawer_bloc.dart';

class Prov_editprofile extends StatefulWidget {
  @override
  _Prov_editprofileState createState() => _Prov_editprofileState();
}

class _Prov_editprofileState extends State<Prov_editprofile> {
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

  Widget editimages() {
    return RaisedButton(
      color: Colors.blue.shade700,
      onPressed: () {},
      child: Text(
        "แก้ไขรูปภาพ",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
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
        child: DrawerLayout(),
      ),
    );
  }

// return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Colors.yellow.shade700,
//         actions: <Widget>[],
//       ),
//       body: Column(
//         children: <Widget>[
//           edit_profile(),
//           Text("$name",),
//           Text("$email"),
//           Text("ที่อยู่"),
//           Text("$phone"),
//         ],
//       ),
//     );

  // Widget edit_profile() {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(20.0),
  //     color: Theme.of(context).primaryColor,
  //     child: Center(
  //       child: Column(children: <Widget>[
  //         Container(
  //           width: 100.0,
  //           height: 100.0,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             image: DecorationImage(
  //                 image: NetworkImage(
  //                   "https://picsum.photos/250?image=9",
  //                 ),
  //                 fit: BoxFit.fill),
  //           ),
  //         ),
  //         editimages(),
  //       ]),
  //     ),
  //   );
  // }
}
