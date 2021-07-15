
import 'package:agriser/screens/users/user_chat/chat_.dart';
import 'package:flutter/material.dart';

class User_chat extends StatefulWidget {
  @override
  _User_chatState createState() => _User_chatState();
}

class _User_chatState extends State<User_chat> {

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
              builder: (BuildContext context) => Chat_());
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
            
            Success("Chat"),
            
          ]),
        ),
      ),
    );
  }
}