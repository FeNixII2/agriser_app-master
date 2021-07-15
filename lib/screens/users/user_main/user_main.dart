import 'dart:io';

import 'package:agriser/screens/home.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../menu_user_bar.dart';

class User_main extends StatefulWidget {
  @override
  _User_mainState createState() => _User_mainState();
}

class _User_mainState extends State<User_main> {
  RateMyApp rateMyApp = RateMyApp(
  preferencesPrefix: 'rateMyApp_',
  minDays: 7,
  minLaunches: 10,
  remindDays: 7,
  remindLaunches: 10,
  googlePlayIdentifier: 'fr.skyost.example',
  appStoreIdentifier: '1491556149',
);
  var imgList = [
    "assets/images/business.png",
    "assets/images/doctor.png",
    "assets/images/business2.png",
    "assets/images/designer.png"
  ];

  var name = [
    "Sinthop Apiwong",
    "Sutipong Kamwongsa",
    "Danai Wicha",
    "Terawat Kunkamhom"
  ];

  var title = [
    "Red",
    "Green",
    "Blue",
    "White",
  ];

  Container ShowProv(String imageVal, String heading, String subHeading) {
    return Container(
      width: 150.0,
      height: 220.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(imageVal),
            ListTile(
              title: Text(heading),
              subtitle: Text(subHeading),
            ),
          ],
        ),
      ),
    );
  }

   Widget workbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "ประกาศงาน",
          style: GoogleFonts.mitr(fontSize: 30, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          print("#ประกาศงาน");
          rateMyApp.showStarRateDialog(
      context,
      title: 'ให้คะแนนสำหรับงานนี้', // The dialog title.
      message: 'คุณพึงพอใจกับการให้บริการสำหรับงานนี้เท่าไหร่', // The dialog message.
      // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
      actionsBuilder: (context, stars) { // Triggered when the user updates the star rating.
        return [ // Return a list of actions (that will be shown at the bottom of the dialog).
          FlatButton(
            child: Text('OK'),
            onPressed: () async {
             if (stars != null) {
                    
                    rateMyApp.save().then((v) => Navigator.pop(context));

                    if (stars <= 3) {
                      print('Navigate to Contact Us Screen');
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => ContactUsScreen(),
                      //   ),
                      // );
                    } else if (stars <= 5) {
                      print('Leave a Review Dialog');
                      // showDialog(...);
                    }
                  } else {
                    Navigator.pop(context);
                  }
            },
          ),
        ];
      },
      ignoreNativeDialog: Platform.isAndroid, // Set to false if you want to show the Apple's native app rating dialog on iOS or Google's native app rating dialog (depends on the current Platform).
      dialogStyle: DialogStyle( // Custom dialog styles.
        titleAlign: TextAlign.center,
        messageAlign: TextAlign.center,
        messagePadding: EdgeInsets.only(bottom: 20),
      ),
      starRatingOptions: StarRatingOptions(), // Custom star bar rating options.
      onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
    );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Menu_user_bar(),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          
          workbutton(),
        ],
      ),
    );
  }
}



// Container(
//             margin: EdgeInsets.symmetric(vertical: 10.0),
//             height: 210.0,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: <Widget>[
//                 ShowProv("business", "Name", "Work"),
//                 ShowProv("https://picsum.photos/250?image=9", "Name1", "Work1"),
//                 ShowProv("https://picsum.photos/250?image=9", "Name2", "Work2"),
//                 ShowProv("https://picsum.photos/250?image=9", "Name3", "Work3"),
//                 ShowProv("https://picsum.photos/250?image=9", "Name4", "Work4"),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 10.0),
//             height: 210.0,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: <Widget>[
//                 ShowProv("https://picsum.photos/250?image=9", "Name", "Work"),
//                 ShowProv("https://picsum.photos/250?image=9", "Name1", "Work1"),
//                 ShowProv("https://picsum.photos/250?image=9", "Name2", "Work2"),
//                 ShowProv("https://picsum.photos/250?image=9", "Name3", "Work3"),
//                 ShowProv("https://picsum.photos/250?image=9", "Name4", "Work4"),
//               ],
//             ),
//           ),