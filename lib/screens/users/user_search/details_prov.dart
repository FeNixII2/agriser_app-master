import 'package:agriser/screens/providers/prov.dart';
import 'package:agriser/screens/users/user_search/confirm_appointment.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Details_prov extends StatefulWidget {
  final SearchType searchType;

  Details_prov({Key key, this.searchType}) : super(key: key);

  @override
  _Details_provState createState() => _Details_provState();
}

class _Details_provState extends State<Details_prov> {
  String name, details, price, address, uid, phone;

  SearchType searchType = SearchType();

  Widget showlogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset("images/logo.png"),
    );
  }

  Widget Textbox(String description) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue.shade200,),
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            description,
            style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
            
          ),
        ],
      ),
    );
  }

  Widget confirmbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 75,
      child: RaisedButton(
        color: Colors.white,
        child: Text(
          "ถัดไป",
          style: GoogleFonts.mitr(fontSize: 24, color: Colors.blue),
        ),
        onPressed: () {
          searchType.provType = [
            name,
            details,
            price,
            address,
            uid,
          ];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Confirm_appointment(searchType: searchType),
            ),
          );
        },
      ),
    );
  }

  showmaps() {
    return GoogleMap(initialCameraPosition: bangkok);
  }

  static final CameraPosition bangkok = CameraPosition(
    target: LatLng(13.573642234570674, 100.12219581460153),
    zoom: 12,
  );

  Widget build(BuildContext context) {
    name = widget.searchType.provType[0].toString();
    details = widget.searchType.provType[1].toString();
    price = widget.searchType.provType[2].toString();
    address = widget.searchType.provType[3].toString();
    uid = widget.searchType.provType[4].toString();
    phone = widget.searchType.provType[5].toString();
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "รายละเอียดเกี่ยวกับผู้ให้บริการ",
          style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
        )),
        body: Center(
          child: ListView(
            children: [
              showlogo(),
              Textbox("ชื่อ"),
              Text(
                name,
                style: GoogleFonts.mitr(fontSize: 24),
              ),
              Textbox("รายละเอียด"),
              Text(details,style: GoogleFonts.mitr(fontSize: 24),),
              Textbox("เบอร์โทรศัพท์"),
              Text(phone,style: GoogleFonts.mitr(fontSize: 24),),
              Textbox("ราคาต่อไร่"),
              Text(price,style: GoogleFonts.mitr(fontSize: 24),),
              Textbox("ที่อยู่"),
              Text(address,style: GoogleFonts.mitr(fontSize: 24),),
              Textbox("แผนที่"),
              Container(
                height: 700,
                child: showmaps(),
              ),
              confirmbutton(),
            ],
          ),
        ));
  }
}

//AIzaSyA-_Nc48MPaJBLBjPiLv6XXoxEFz46f7sY
