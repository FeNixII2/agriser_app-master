import 'package:flutter/material.dart';

class Chat_room extends StatefulWidget {
  @override
  _Chat_roomState createState() => _Chat_roomState();
}

class _Chat_roomState extends State<Chat_room> {

  var kBackgroundColor = Color(0xFF1d8da9);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: kBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
            ],
          ),
        ),
      ),
    );
  }
}