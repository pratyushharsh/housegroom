import 'package:flutter/material.dart';
import 'package:housegroom/home/view/explore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetList = [
    LandingScreen(),
    LandingScreen(),
    LandingScreen(),
    LandingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_rounded),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: "User",
              ),
            ],
            unselectedItemColor: Colors.black45,
            selectedItemColor: Colors.greenAccent,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
