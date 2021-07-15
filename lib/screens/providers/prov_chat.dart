import 'package:agriser/screens/providers/prov_chat.dart';
import 'package:flutter/material.dart';

class Prov_chat extends StatefulWidget {
  @override
  _Prov_chatState createState() => _Prov_chatState();
}

class _Prov_chatState extends State<Prov_chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Provider Chat Page",
              style: TextStyle(fontSize: 25.0),
            )
          ],
        ),
      ),);
  }
}