import 'package:agriser/screens/users/user_work_schedule/user_reply.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriser/screens/providers/prov.dart';


class Schedule_success extends StatefulWidget {
  final SearchType searchType;

  Schedule_success({Key key, this.searchType}) : super(key: key);
  @override
  _Schedule_successState createState() => _Schedule_successState();
}

class _Schedule_successState extends State<Schedule_success> {
  
  SearchType searchType = SearchType();
  String count_rai, description, name, phone, time, price, result;

  CollectionReference reply =
      FirebaseFirestore.instance.collection("Appointment");

  List providerList = [];
  Future getreply() async {
    FirebaseAuth ww = FirebaseAuth.instance;
    String uid_user = ww.currentUser.uid.toString();
    await reply.doc("Success").collection(uid_user).get().then((value) {
      value.docs.forEach((element) {
        // print(element.data()["name"]);
        providerList.add(element.data());
      });
    });
    return providerList;
  }

  medtodreply() {
    return FutureBuilder(
      future: getreply(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;
          print("ดึงข้อมูลได้แล้วครับ");
          // print(result);
          return Container(
            child: ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(result[index]["name_provider_emp"]),
                    subtitle: Text(result[index]["time"]),
                    leading: CircleAvatar(
                      child: Image(
                        image: AssetImage("https://picsum.photos/250?image=9"),
                      ),
                    ),
                    trailing: Text("Score: 100"),
                    onTap: () {},
                  ),
                );
              },
            ),
          );
        }
        return LinearProgressIndicator();
      },
    );
  }

  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getreply(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data;
              print("ดึงข้อมูลได้แล้วครับ");
              // print(result);
              return Container(
                child: ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(result[index]["name_provider_emped"]),
                        subtitle: Text(result[index]["time"]),
                        leading: CircleAvatar(
                          child: Image(
                            image:
                                AssetImage("https://picsum.photos/250?image=9"),
                          ),
                        ),
                        trailing: FlatButton(
                          onPressed: () {
                            print("ให้คะแนน");
                            
                          },
                          child: Text(
                            "ให้คะแนน",
                          ),
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              );
            }
            return LinearProgressIndicator();
          },
        ));
  }
}
