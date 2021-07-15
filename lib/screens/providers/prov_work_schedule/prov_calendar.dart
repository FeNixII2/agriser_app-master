import 'package:agriser/screens/providers/prov_work_schedule/prov_calendar.dart';
import 'package:flutter/material.dart';
import 'package:agriser/screens/providers/prov_work_schedule/prov_schedule_wait.dart';
import 'package:agriser/screens/providers/prov_work_schedule/prov_schedule_success.dart';
import 'package:agriser/screens/providers/prov_work_schedule/prov_schedule_fail.dart';

class Prov_calendar extends StatefulWidget {
  @override
  _Prov_calendarState createState() => _Prov_calendarState();
}

class _Prov_calendarState extends State<Prov_calendar> {
  Widget Wait(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.green,
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
              builder: (BuildContext context) => Prov_schedule_wait());
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
        color: Colors.green,
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
              builder: (BuildContext context) => Prov_schedule_success());
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
        color: Colors.green,
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
              builder: (BuildContext context) => Prov_schedule_fail());
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
