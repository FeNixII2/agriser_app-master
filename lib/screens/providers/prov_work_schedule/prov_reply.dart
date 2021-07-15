import 'package:agriser/screens/users/all_user_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../all_prov_page.dart';
import '../prov.dart';

class Prov_reply extends StatefulWidget {
  final SearchType searchType;

  Prov_reply({Key key, this.searchType}) : super(key: key);
  @override
  _Prov_replyState createState() => _Prov_replyState();
}

class _Prov_replyState extends State<Prov_reply> {

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
        String full = "Reply" + "/" + uid_user + "/" + iddoc ;
        FirebaseFirestore.instance.collection("Appointment").doc(full).delete();
      });
    });

   
  }

  createdata() async {
    uid_prov = widget.searchType.provType[6].toString();
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
    CollectionReference prov_suc =
        FirebaseFirestore.instance.collection("Appointment");
    prov_suc.doc("Success_prov").collection(uid_user).doc().set({
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
  String name, count_rai, phone, time, description,address, uid_prov;
Widget Textbox(String description) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            description,
            style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
   Widget showlogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset("images/logo.png"),
    );
  }
  showmaps() {
    return GoogleMap(initialCameraPosition: bangkok);
  }
  static final CameraPosition bangkok = CameraPosition(
    target: LatLng(13.573642234570674, 100.12219581460153),
    zoom: 12,
  );
  @override
  Widget build(BuildContext context) {
    print(widget.searchType.provType[0].toString());
    name = widget.searchType.provType[0].toString();
    description = widget.searchType.provType[1].toString();
    time = widget.searchType.provType[2].toString();
    phone = widget.searchType.provType[3].toString();
    count_rai = widget.searchType.provType[4].toString();
    address = widget.searchType.provType[5].toString();
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green,),
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   showlogo() ,
                  
                  Textbox("ชื่อ "),
                  Text(name, style: TextStyle(fontSize: 22)),
                  Textbox("รายละเอียดเพิ่มเติม"),
                  Text(description,
                      style: TextStyle(fontSize: 22)),

                  Textbox("เวลาที่นัดหมาย  " ),
                  Text(time,
                      style: TextStyle(fontSize: 22)),
                  Textbox("เบอร์โทรศัพท์  "  ),
                  Text(phone,
                      style: TextStyle(fontSize: 22)),
                  Textbox("จำนวนไร่  " ),
                  Text(count_rai,
                      style: TextStyle(fontSize: 22)),
                      Textbox("ที่อยู่  " ),
                      Text(address,
                      style: TextStyle(fontSize: 22)),
                      Textbox("แผนที่  " ),
                      Container(
                height: 150,
                child: showmaps(),
              ),
              
                  RaisedButton(
                      child:
                          const Text('ยืนยัน', style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        myAlert();
                      }),
                  RaisedButton(
                    child: const Text('ปฏิเสธ', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      deletedata2();
                      createdata2();
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => All_prov_page());
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

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ตอบรับการจ้างงาน'),
            content: Text('คุณต้องการตอบรับการจ้างงานนี้หรือไม่?'),
            actions: <Widget>[cancelButton(), okButton()],
          );
        });
  }

  Widget okButton() {
    return FlatButton(
      child: Text('ตกลง'),
      onPressed: () {
        deletedata();
                        createdata();
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                            builder: (BuildContext context) => All_prov_page());
                        Navigator.of(context).pushAndRemoveUntil(
                            materialPageRoute, (Route<dynamic> route) => false);
      },
    );
  }

  Widget cancelButton() {
    return FlatButton(
      child: Text('ยกเลิก'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
