import 'package:agriser/screens/providers/prov.dart';
import 'package:agriser/screens/users/user_work_schedule/user_reply.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Schedule_wait extends StatefulWidget {
  final SearchType searchType;

  Schedule_wait({Key key, this.searchType}) : super(key: key);
  @override
  _Schedule_waitState createState() => _Schedule_waitState();
}

class _Schedule_waitState extends State<Schedule_wait> {
  SearchType searchType = SearchType();
  String count_rai, description, name, phone, time, price, result, uid_prov;
  Widget Stearmbuilder() {
    FirebaseAuth ww = FirebaseAuth.instance;
    String uid_user = ww.currentUser.uid.toString();
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Appointment")
            .doc("Request")
            .collection(uid_user)
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.doc.length,
              itemBuilder: (context, index) {
                DocumentSnapshot course = snapshot.data.doc[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Image(
                      image: AssetImage("https://picsum.photos/250?image=9"),
                    ),
                  ),
                  title: Text(course["name_user_emp"]),
                  subtitle: Text(course["time"]),
                );
              });
        });
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60,
            child: TabBar(tabs: [
              Tab(text: "ตารางงาน"),
              Tab(text: "ตารางการยืนยันงาน"),
            ]),
          ),
          Container(
              //Add this to give height
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: TabBarView(children: [
                  Container(
                    child: Text("ตารางงาน"),
                  ),
                  // medtodreply(),
                  medtodreply(),
                ]),
              )),
        ],
      ),
    );
  }

  CollectionReference reply =
      FirebaseFirestore.instance.collection("Appointment");

  List providerList = [];
  Future getreply() async {
    FirebaseAuth ww = FirebaseAuth.instance;
    String uid_user = ww.currentUser.uid.toString();
    await reply.doc("Request").collection(uid_user).get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        print(element.id);
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
                    title: Text(
                      result[index]["name_provider_emped"],
                      style: TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      result[index]["time"],
                      style: TextStyle(fontSize: 20),
                    ),
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
                        title: Text(result[index]["name_provider_emped"],
                            style: TextStyle(fontSize: 28)),
                        subtitle: Text(result[index]["time"],
                            style: TextStyle(fontSize: 22)),
                        leading: CircleAvatar(
                          child: Image(
                            image:
                                AssetImage("https://picsum.photos/250?image=9"),
                          ),
                        ),
                        trailing: Text("รอการยืนยัน"),
                        onTap: () {
                          count_rai = result[index]["count_rai"].toString();
                          description = result[index]["description"].toString();
                          name = result[index]["name_user_emp"].toString();
                          phone = result[index]["phone_user"].toString();
                          time = result[index]["time"].toString();
                          uid_prov = result[index]["uid_user"].toString();
                          searchType.provType = [
                            name,
                            description,
                            time,
                            phone,
                            count_rai,
                            uid_prov,
                          ];
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         User_reply(searchType: searchType),
                          //   ),
                          // );
                        },
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
