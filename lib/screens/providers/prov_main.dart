import 'package:agriser/screens/providers/prov_work_schedule/prov_calendar.dart';
import 'package:agriser/screens/providers/prov_chat.dart';
import 'package:agriser/screens/providers/prov_search.dart';
import 'package:flutter/material.dart';
import 'menu_prov_bar.dart';

class Prov_main extends StatefulWidget {
  @override
  _Prov_mainState createState() => _Prov_mainState();
}

class _Prov_mainState extends State<Prov_main> {
  var imgList = [
    "assets/images/business.png",
    "assets/images/doctor.png",
    "assets/images/business2.png",
    "assets/images/designer.png"
  ];

  var name = [
    "Sinthop Apiwong",
    "Sutipong Kamwongsa",
    "Danai Wicha",
    "Terawat Kunkamhom"
  ];

  var title = [
    "Red",
    "Green",
    "Blue",
    "White",
  ];

  Container ShowProv(String imageVal, String heading, String subHeading) {
    return Container(
      width: 150.0,
      height: 220.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(imageVal),
            ListTile(
              title: Text(heading),
              subtitle: Text(subHeading),
            ),
          ],
        ),
      ),
    );
  }

  // Widget workbutton() {
  //   return RaisedButton(
  //     color: Colors.blue.shade700,
  //     child: Text(
  //       "ค้นหางาน",
  //       style: TextStyle(
  //         color: Colors.white,
  //       ),
  //     ),
  //     onPressed: () {
  //       MaterialPageRoute search =
  //           MaterialPageRoute(builder: (BuildContext context) => Prov_search());
  //       Navigator.of(context).push(search);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      drawer: Menu_prov_bar(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 220.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ShowProv("https://picsum.photos/250?image=9", "Name", "Work"),
                ShowProv("https://picsum.photos/250?image=9", "Name1", "Work1"),
                ShowProv("https://picsum.photos/250?image=9", "Name2", "Work2"),
                ShowProv("https://picsum.photos/250?image=9", "Name3", "Work3"),
                ShowProv("https://picsum.photos/250?image=9", "Name4", "Work4"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 220.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ShowProv("https://picsum.photos/250?image=9", "Name", "Work"),
                ShowProv("https://picsum.photos/250?image=9", "Name1", "Work1"),
                ShowProv("https://picsum.photos/250?image=9", "Name2", "Work2"),
                ShowProv("https://picsum.photos/250?image=9", "Name3", "Work3"),
                ShowProv("https://picsum.photos/250?image=9", "Name4", "Work4"),
              ],
            ),
          ),
          // workbutton(),
        ],
      ),
    );
  }
}
