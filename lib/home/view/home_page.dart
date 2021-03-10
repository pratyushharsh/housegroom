import 'package:flutter/material.dart';
import 'package:housegroom/home/view/landing.dart';
import 'package:housegroom/userProfile/view/user_profile.dart';

class HomePage extends StatefulWidget {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

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
    UserProfile()
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
          body: _widgetList[_selectedIndex],
        ),
      ),
    );
  }
}
