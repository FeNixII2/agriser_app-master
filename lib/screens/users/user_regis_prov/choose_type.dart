import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agriser/screens/users/user_regis_prov/type_agw.dart';
import 'package:agriser/screens/users/user_regis_prov/type_agv.dart';

class Choose_type extends StatefulWidget {
  @override
  _Choose_typeState createState() => _Choose_typeState();
}

class _Choose_typeState extends State<Choose_type> {
  Widget prov_carbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      height: 100.0,
      child: RaisedButton(
        color: Colors.blue,
        child: Text("ลงทะเบียนให้บริการรถทางการเกษตร (ไม่บังคับ)",
            style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          print("#ลงทะเบียนให้บริการรถ");
          MaterialPageRoute regis_prov =
              MaterialPageRoute(builder: (BuildContext context) => Type_AGV());
          Navigator.of(context).push(regis_prov);
        },
      ),
    );
  }

  Widget prov_peoplebutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      height: 100.0,
      child: RaisedButton(
        color: Colors.blue,
        child: Text("ลงทะเบียนให้บริการแรงงานทางการเกษตร (ไม่บังคับ)",
            style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          print("#ลงทะเบียนให้บริการแรงงาน");
          MaterialPageRoute regis_prov =
              MaterialPageRoute(builder: (BuildContext context) => Type_AGW());
          Navigator.of(context).push(regis_prov);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ลงทะเบียนผู้ให้บริการ",
            style: GoogleFonts.mitr(fontSize: 20),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [prov_carbutton(), prov_peoplebutton()],
              )),
        ));
  }
}
