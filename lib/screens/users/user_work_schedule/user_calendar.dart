import 'package:flutter/material.dart';
import 'package:agriser/screens/users/user_work_schedule/schedule_wait.dart';
import 'package:agriser/screens/users/user_work_schedule/schedule_success.dart';
import 'package:agriser/screens/users/user_work_schedule/schedule_fail.dart';

class User_calendar extends StatefulWidget {
  @override
  _User_calendarState createState() => _User_calendarState();
}

class _User_calendarState extends State<User_calendar> {
  Widget Wait(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          print("Next of choose");
          MaterialPageRoute regis_prov = MaterialPageRoute(
              builder: (BuildContext context) => Schedule_wait());
          Navigator.of(context).push(regis_prov);
        },
      ),
    );
  }

  Widget Success(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          print("Next of choose");
          MaterialPageRoute regis_prov = MaterialPageRoute(
              builder: (BuildContext context) => Schedule_success());
          Navigator.of(context).push(regis_prov);
        },
      ),
    );
  }

  Widget Fail(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          print("Next of choose");
          MaterialPageRoute regis_prov = MaterialPageRoute(
              builder: (BuildContext context) => Schedule_fail());
          Navigator.of(context).push(regis_prov);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Wait("งานที่รอการยืนยัน"),
            Success("งานที่ยืนยันแล้ว"),
            Fail("งานที่ยกเลิก"),
          ]),
        ),
      ),
    );
  }
}
