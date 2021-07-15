import 'package:agriser/screens/providers/prov_work_schedule/prov_calendar.dart';
import 'package:agriser/screens/providers/prov_chat.dart';
import 'package:agriser/screens/providers/prov_main.dart';
import 'package:agriser/screens/providers/prov_search.dart';
import 'package:flutter/material.dart';

class All_prov_page extends StatefulWidget {
  @override
  _All_prov_pageState createState() => _All_prov_pageState();
}

class _All_prov_pageState extends State<All_prov_page> {
  int _currenIndex = 0;
  final List<Widget> _children = [
    Prov_main(),
    Prov_search(),
    Prov_calendar(),
    Prov_chat(),
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
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.green,
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: onTappedBar,
              currentIndex: _currenIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("หน้าหลัก"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text("ค้นหา"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: Text("ตารางงาน"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  title: Text("แชท"),
                ),
              ]),
        ));
  }
}
