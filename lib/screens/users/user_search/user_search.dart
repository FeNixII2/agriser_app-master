import 'package:agriser/screens/users/user_search/search_type_agv.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User_search extends StatefulWidget {
  @override
  _User_searchState createState() => _User_searchState();
}

class _User_searchState extends State<User_search> {
  Widget AGV(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(text,
            style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          print("Next of choose");
          MaterialPageRoute regis_prov = MaterialPageRoute(
              builder: (BuildContext context) => Search_type_agv());
          Navigator.of(context).push(regis_prov);
        },
      ),
    );
  }

  Widget AGW(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(text,
            style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {},
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
            AGV("ผู้ให้บริการรถทางการเกษตร"),
            AGW("ผู้ให้บริการแรงงานทางการเกษตร"),
          ]),
        ),
      ),
    );
  }
}
