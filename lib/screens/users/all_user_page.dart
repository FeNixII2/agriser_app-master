import 'package:agriser/screens/users/user_work_schedule/user_calendar.dart';
import 'package:agriser/screens/users/user_chat/user_chat.dart';
import 'package:agriser/screens/users/user_main/user_main.dart';
import 'package:agriser/screens/users/user_search/user_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class All_user_page extends StatefulWidget {
  @override
  _All_user_pageState createState() => _All_user_pageState();
}

class _All_user_pageState extends State<All_user_page> {
  int _currenIndex = 0;
  final List<Widget> _children = [
    User_main(),
    User_search(),
    User_calendar(),
    User_chat(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currenIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTappedBar,
          currentIndex: _currenIndex,
          unselectedLabelStyle: GoogleFonts.mitr(),
          selectedLabelStyle: GoogleFonts.mitr(),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("หน้าหลัก",style: TextStyle(fontSize: 22)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("ค้นหา",style: TextStyle(fontSize: 22)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text("ตารางงาน",style: TextStyle(fontSize: 22)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              title: Text("แชท",style: TextStyle(fontSize: 22)),
            ),
          ]),
    );
  }
}
