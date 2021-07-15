import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agriser/screens/users/user_regis_prov/choose_type.dart';

class Regis_createprov extends StatefulWidget {
  @override
  _Regis_createprovState createState() => _Regis_createprovState();
}

class _Regis_createprovState extends State<Regis_createprov> {
  Widget create() {
    return Container(
      padding: EdgeInsets.all(4),
      width: double.infinity,
      child: FlatButton(
        textColor: Colors.white,
        color: Colors.cyan,
        onPressed: () {
          print("#ประกาศงาน");
          MaterialPageRoute route = MaterialPageRoute(
              builder: (BuildContext context) => Choose_type());
          Navigator.of(context).push(route);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ลงทะเบียนบริการ",
              style: GoogleFonts.mitr(fontSize: 30, color: Colors.white),
            ),
            Icon(
              Icons.create,
              size: 35,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "ผู้ให้บริการ",
          style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
        )),
        body: Column(
          children: <Widget>[
            create(),
          ],
        ));
  }
}
