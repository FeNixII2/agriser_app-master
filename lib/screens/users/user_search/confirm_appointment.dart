import 'package:agriser/main.dart';
import 'package:agriser/screens/providers/prov.dart';
import 'package:agriser/screens/time/date_time_picker_widget2.dart';
import 'package:agriser/screens/time/notifcation_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../all_user_page.dart';

class Confirm_appointment extends StatefulWidget {
  final SearchType searchType;

  Confirm_appointment({Key key, this.searchType}) : super(key: key);

  @override
  _Confirm_appointmentState createState() => _Confirm_appointmentState();
}

class _Confirm_appointmentState extends State<Confirm_appointment> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  String name, details, price, address, uid, count_text, details_text, phone;
  TextEditingController inputcount = new TextEditingController();
  TextEditingController inputdetails = new TextEditingController();

  Widget Textcount() {
    return TextField(
        keyboardType: TextInputType.number,
        controller: inputcount,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "ใส่จำนวนไร่",
        ),style: TextStyle(fontSize: 22));
  }

  Widget Textdetails() {
    return TextFormField(
        controller: inputdetails,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "ใส่รายละเอียด",
        ),style: TextStyle(fontSize: 22),);
  }

  @override
  Widget build(BuildContext context) {
    name = widget.searchType.provType[0].toString();
    price = widget.searchType.provType[2].toString();
    address = widget.searchType.provType[3].toString();
    uid = widget.searchType.provType[4].toString();
    return Scaffold(
        appBar: AppBar(title: Text("ยืนยันการนัดหมาย")),
        body: Center(
          child: ListView(
            children: [
              Textbox("ระบุจำนวนไร่"),
              Textcount(),
              // TextField(keyboardType: TextInputType.number),
              Textbox("ระบุวันเวลาที่ต้องการจ้างงาน"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Text(dateFormat.format(selectedDate),style: TextStyle(fontSize: 22)),
                  RaisedButton(
                    child: Text('เลือกวันเวลา'),
                    onPressed: () async {
                      showDateTimeDialog(context, initialDate: selectedDate,
                          onSelectedDate: (selectedDate) {
                        setState(() {
                          this.selectedDate = selectedDate;
                        });
                      });
                    },
                  ),
                ],
              ),
              Textbox("ระบุรายละเอียดเกี่ยวกับการจ้าง"),
              Textdetails(),

              loginbutton(),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ยืนยันการจ้างงาน'),
            content: Text('คุณต้องการยืนยันการจ้างงานนี้หรือไม่?'),
            actions: <Widget>[cancelButton(), okButton()],
          );
        });
  }

  Widget okButton() {
    return FlatButton(
      child: Text('ตกลง'),
      onPressed: () {
        count_text = inputcount.text;
          details_text = inputdetails.text;

          print("เพิ่มข้อมูลการนัดหมาย");
          addData();
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => All_user_page());
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

  Future<void> addData(
      // String email, String pass, String name, String phone,
      //     String status
      ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid_user = auth.currentUser.uid.toString();
    final userRef = FirebaseFirestore.instance.collection("Users");
    DocumentSnapshot doc = await userRef.doc(uid_user).get();
    Map<String, dynamic> mapEventData = doc.data();
    String user_employ = mapEventData['name'];
    String user_phone = mapEventData['phone'];

    print("UID IS " + uid_user);
    print("USER EMPLOY " + user_employ);
    CollectionReference reply =
        FirebaseFirestore.instance.collection("Appointment");
    reply.doc("Request").collection(uid_user).doc().set({
      "name_user_emp": user_employ,
      "name_provider_emped": name,
      "count_rai": count_text,
      "time": dateFormat.format(selectedDate).toString(),
      "description": details_text,
      "phone_user": user_phone,
      "phone_provider": phone,
      "uid_user": uid_user,
      "user_prov": uid,
      "address": address,
    });

    CollectionReference request =
        FirebaseFirestore.instance.collection("Appointment");
    request.doc("Reply").collection(uid).doc(dateFormat.format(selectedDate).toString()).set({
      "name_user_emp": user_employ,
      "name_provider_emped": name,
      "count_rai": count_text,
      "time": dateFormat.format(selectedDate).toString(),
      "description": details_text,
      "phone_user": user_phone,
      "phone_provider": phone,
      "uid_user": uid_user,
      "user_prov": uid,
      "address": address,
    });
    return;
  }
  Widget Textbox(String description) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
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

  Widget loginbutton() {
    return Container(
      
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "ยืนยันการนัดหมาย",
          style: TextStyle(fontSize: 30,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          myAlert();
        },
      ),
    );
  }
}
