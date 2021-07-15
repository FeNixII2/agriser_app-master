import 'package:agriser/screens/users/user_work_schedule/user_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriser/screens/providers/prov.dart';

import '../all_user_page.dart';

class User_reply extends StatefulWidget {
  final SearchType searchType;

  User_reply({Key key, this.searchType}) : super(key: key);
  @override
  _User_replyState createState() => _User_replyState();
}

class _User_replyState extends State<User_reply> {
  @override
  void initState() {
    super.initState();
  }

  deletedata() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid_user = auth.currentUser.uid.toString();
    CollectionReference provi = FirebaseFirestore.instance
        .collection("Appointment")
        .doc("Reply")
        .collection(uid_user);

    provi.where("time", isEqualTo: time).get().then((value) {
      value.docs.forEach((element) {
        // print(element.data()["name"]);
        String iddoc = element.id;
        print(uid_user);
        print(iddoc);
        String full = "Reply" + "/" + uid_user + "/" + iddoc;
        print(full);
        FirebaseFirestore.instance.collection("Appointment").doc(full).delete();
      });
    });
  }

  createdata() async {
    uid_prov = widget.searchType.provType[5].toString();
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid_user = auth.currentUser.uid.toString();

    final userRef = FirebaseFirestore.instance.collection("Users");
    DocumentSnapshot doc = await userRef.doc(uid_user).get();
    Map<String, dynamic> mapEventData = doc.data();
    String user_prov = mapEventData['name'];
    String user_phone = mapEventData['phone'];

    CollectionReference request =
        FirebaseFirestore.instance.collection("Appointment");
    request.doc("Success").collection(uid_prov).doc().set({
      "name_user_emp": name,
      "name_provider_emped": user_prov,
      "count_rai": count_rai,
      "time": time,
      "description": description,
      "phone_user": phone,
      "phone_provider": user_phone,
    });
  }

  deletedata2() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid_user = auth.currentUser.uid.toString();
    CollectionReference provi = FirebaseFirestore.instance
        .collection("Appointment")
        .doc("Reply")
        .collection(uid_user);

    provi.where("time", isEqualTo: time).get().then((value) {
      value.docs.forEach((element) {
        // print(element.data()["name"]);
        String iddoc = element.id;
        print(uid_user);
        print(iddoc);
        String full = "Reply" + "/" + uid_user + "/" + iddoc;
        print(full);
        FirebaseFirestore.instance.collection("Appointment").doc(full).delete();
      });
    });
  }

  createdata2() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid_user = auth.currentUser.uid.toString();

    final userRef = FirebaseFirestore.instance.collection("Users");
    DocumentSnapshot doc = await userRef.doc(uid_user).get();
    Map<String, dynamic> mapEventData = doc.data();
    String user_prov = mapEventData['name'];
    String user_phone = mapEventData['phone'];

    CollectionReference request =
        FirebaseFirestore.instance.collection("Appointment");
    request.doc("Fail").collection(uid_user).doc().set({
      "name_user_emp": name,
      "name_provider_emped": user_prov,
      "count_rai": count_rai,
      "time": time,
      "description": description,
      "phone_user": phone,
      "phone_provider": user_phone,
    });
  }

  SearchType searchType = SearchType();
  String name, count_rai, phone, time, description, uid_prov;
  @override
  Widget build(BuildContext context) {
    print(widget.searchType.provType[0].toString());
    name = widget.searchType.provType[0].toString();
    description = widget.searchType.provType[1].toString();
    time = widget.searchType.provType[2].toString();
    phone = widget.searchType.provType[3].toString();
    count_rai = widget.searchType.provType[4].toString();
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("ชื่อ  " + name, style: TextStyle(fontSize: 20)),
                  Text("รายละเอียดเพิ่มเติม  " + description,
                      style: TextStyle(fontSize: 20)),
                  Text("เวลาที่นัดหมาย  " + time,
                      style: TextStyle(fontSize: 20)),
                  Text("เบอร์โทรศัพท์  " + phone,
                      style: TextStyle(fontSize: 20)),
                  Text("จำนวนไร่  " + count_rai,
                      style: TextStyle(fontSize: 20)),
                  RaisedButton(
                      child:
                          const Text('ยืนยัน', style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        deletedata();
                        createdata();
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                            builder: (BuildContext context) => All_user_page());
                        Navigator.of(context).pushAndRemoveUntil(
                            materialPageRoute, (Route<dynamic> route) => false);
                      }),
                  RaisedButton(
                    child: const Text('ปฏิเสธ', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      deletedata2();
                      createdata2();
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => All_user_page());
                      Navigator.of(context).pushAndRemoveUntil(
                          materialPageRoute, (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
