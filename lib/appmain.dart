import 'package:flutter/material.dart';
import 'package:signier_demo/pages/assignments_page.dart';
import 'package:signier_demo/pages/learning_page.dart';
import 'pages/translate_page.dart';
import 'package:signier_demo/profilepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const TranslatePage(),
    const LearningPage(),
    const AssignmentsPage(),
    const ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.cyan[400],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.translate),
              label: 'translate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'ToBeconfirmed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
