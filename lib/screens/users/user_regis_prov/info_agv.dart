import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info_agv extends StatefulWidget {
  @override
  _Info_agvState createState() => _Info_agvState();
}

class _Info_agvState extends State<Info_agv> {
  String dropdownValue = 'ไร่';

  Widget comfirmbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      height: 75,
      child: RaisedButton(
        color: Colors.blue.shade700,
        child: Text(
          "ถัดไป",
          style: GoogleFonts.mitr(fontSize: 30, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          print("#ยืนยันการสมัคร");
          
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ข้อมูลเกี่ยวกับผู้ให้บริการ",
            style: GoogleFonts.mitr(fontSize: 20),
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView(padding: EdgeInsets.all(8.0), children: [
          IconButton(
            icon: Icon(
              Icons.photo_size_select_actual,
            ),
            onPressed: () {
              print("ee");
            },
          ),
          Row(
            children: <Widget>[
              Text("กำหนดราคา", style: GoogleFonts.mitr(fontSize: 20)),
              new Flexible(
                child: new TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      hintText: 'Enter a search term'),
                ),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['ไร่', 'วัน', 'ชั่วโมง']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: GoogleFonts.mitr(fontSize: 20)),
                  );
                }).toList(),
              )
            ],
          ),
          Text("ใส่เบอร์โทรติดต่อ", style: GoogleFonts.mitr(fontSize: 20)),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Enter a search term'),
          ),
          Text(
              "ใส่รายละเอียดเพิ่มเติม เช่น (ข้อมูลการให้บริการ, วันเวลาที่ให้บริการ)",
              style: GoogleFonts.mitr(fontSize: 20)),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Enter a search term'),
          ),
          Text(
            "ข้อมูลเครื่องจักร",
            style: GoogleFonts.mitr(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text("ยี่ห้อ", style: GoogleFonts.mitr(fontSize: 20)),
          TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Enter a search term'),
          ),
          Text("อายุเครื่องจักร", style: GoogleFonts.mitr(fontSize: 20)),
          TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Enter a search term'),
          ),
          Text("รูปภาพ", style: GoogleFonts.mitr(fontSize: 20)),
          IconButton(
            icon: Icon(
              Icons.photo_size_select_actual,
            ),
            onPressed: () {
              print("ee");
            },
          ),
        ]));
  
  }
}