import 'package:agriser/screens/providers/prov.dart';
import 'package:agriser/screens/users/user_search/type_user_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search_type_agv extends StatefulWidget {
  @override
  _Search_type_agvState createState() => _Search_type_agvState();
}

class _Search_type_agvState extends State<Search_type_agv> {
  
  SearchType searchType = SearchType();
  
  List providerList = [];
  CollectionReference provi = FirebaseFirestore.instance.collection("ListAGV");
  Future getprovider() async {
    await provi.get().then((value) {
      value.docs.forEach((element) {
        // print(element.data()["name"]);
        providerList.add(element.data());
      });
    });
    return providerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "ประเภทผู้ให้บริการ",
          style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
        )),
        body: FutureBuilder(
          future: getprovider(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data;
              print("ดึงข้อมูลได้แล้วครับ");
              // print(result);
              return Container(
                decoration: new BoxDecoration(color: Colors.grey.shade300),
                child: ListView.builder(
                  padding: EdgeInsets.all(5.0),
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.width * 0.2,
                      child: Card(
                        child: Container(
                          child: FlatButton(
                            onPressed: () {
                              searchType.provType = [result[index]["type"]];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Type_user_search(
                searchType: searchType,
              ),
            ),
          );
                            },
                            child: Text(
                              result[index]["type"],
                              style: GoogleFonts.mitr(fontSize: 24),
                            ),
                          ),
                        ),
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