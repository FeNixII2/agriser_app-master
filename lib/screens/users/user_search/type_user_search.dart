import 'package:agriser/screens/providers/prov.dart';
import 'package:agriser/screens/users/user_search/details_prov.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Type_user_search extends StatefulWidget {
  final SearchType searchType;

  Type_user_search({Key key, this.searchType}) : super(key: key);

  @override
  _Type_user_searchState createState() => _Type_user_searchState();
}

class _Type_user_searchState extends State<Type_user_search> {
  SearchType searchType = SearchType();

  dynamic name, scope, phone;

  @override
  void initState() {
    super.initState();
    print("กำลังดึงข้อมูลผู้ให้บริการ");
    // getprovider();
  }

  List providerList = [];
  CollectionReference provi =
      FirebaseFirestore.instance.collection("Providers");
  Future getprovider() async {
    await provi
        .where("scope", isEqualTo: widget.searchType.provType[0])
        .get()
        .then((value) {
      value.docs.forEach((element) {
        // print(element.data()["name"]);
        providerList.add(element.data());
      });
    });
    return providerList;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.searchType.provType[0]);
    print("Build");
    return Scaffold(
      
        appBar: AppBar(title: Text("ผู้ให้บริการ",style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),)),
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
                    return Card(
                      child: ListTile(
                        title: Text(result[index]["name"],style: GoogleFonts.mitr(fontSize: 24),),
                        subtitle: Text(result[index]["scope"],style: GoogleFonts.mitr(fontSize: 24),),
                        leading: CircleAvatar(
                          child: Image(
                            width: 200.0,
                            height: 200.0,
                            image:
                                AssetImage("https://picsum.photos/250?image=9"),
                          ),
                        ),
                        trailing: Text(result[index]["price"].toString()+"฿",style: GoogleFonts.mitr(fontSize: 24, color: Colors.yellow.shade800),),
                        onTap: () {
                          print("คุณได้เลือก ${result[index]["name"]}");
                          print("คุณได้เลือก ${result[index]["uid"]}");
                          String name, details, price, address, uid;
                          name = result[index]["name"].toString();
                          details = result[index]["details"].toString();
                          price = result[index]["price"].toString();
                          address = result[index]["address"].toString();
                          uid = result[index]["uid"].toString();
                          phone = result[index]["phone"].toString();
                          searchType.provType = [
                            name,
                            details,
                            price,
                            address,
                            uid,
                            phone,
                          ];

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Details_prov(searchType: searchType),
                            ),
                          );
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
