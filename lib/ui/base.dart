import 'package:covid_19_tracker/ui/donate_page.dart';
import 'package:covid_19_tracker/ui/home_page.dart';
import 'package:covid_19_tracker/ui/hotline_screen.dart';
import 'package:covid_19_tracker/ui/news.dart';
import 'package:covid_19_tracker/ui/preventative_measures_screen.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {

  int _current = 0;
  final List<Widget> _screens = [
    HomePage(),
    PreventativeMeasuresScreen(),
    HotlineScreen(),
    NewsList(),
    DonatePage()
  ];

  void _onTap(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_current],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _current,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: darkColor,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: darkColor),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.accessibility_new,
                color: darkColor,
              ),
              title: Text(
                "Prevention",
                style: TextStyle(color: darkColor),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.phone_in_talk,
                color: darkColor,
              ),
              title: Text(
                "Hotline",
                style: TextStyle(color: darkColor),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.language,
                color: darkColor,
              ),
              title: Text(
                "News",
                style: TextStyle(color: darkColor),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
                color: darkColor,
              ),
              title: Text(
                "Donate",
                style: TextStyle(color: darkColor),
              ),
              backgroundColor: Colors.white)
        ],
      ),
    );
  }
}

