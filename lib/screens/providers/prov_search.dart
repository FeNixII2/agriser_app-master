import 'package:agriser/screens/providers/prov_search.dart';
import 'package:flutter/material.dart';
import '../users/user_search/type_user_search.dart';
import 'package:agriser/screens/providers/prov_searchtype.dart';
import 'package:agriser/screens/providers/prov.dart';

class Prov_search extends StatefulWidget {
  @override
  _Prov_searchState createState() => _Prov_searchState();
}

class _Prov_searchState extends State<Prov_search> {
  SearchType searchType = SearchType();

  Widget prov_search1button() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          "ปลูกข้าว",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          searchType.provType = ['ปลูกข้าว'];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchTypePage(
                searchType: searchType,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget prov_search2button() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          "เกี่ยวข้าว",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          searchType.provType = ['เกี่ยวข้าว'];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchTypePage(
                searchType: searchType,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget prov_search3button() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          "ไถนา",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          searchType.provType = ['ไถนา'];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchTypePage(
                searchType: searchType,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          child: ListView(
            padding: EdgeInsets.all(30.0),
            children: <Widget>[
              prov_search1button(),
              prov_search2button(),
              prov_search3button(),
            ],
          ),
        ),
      ]),
    );
  }
}
