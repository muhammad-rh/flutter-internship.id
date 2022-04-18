import 'package:flutter/material.dart';
import 'package:flutter_project/manager/guest_manager.dart';
import 'package:flutter_project/screens/activity_screen.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/network_screen.dart';
import 'package:flutter_project/screens/profil_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;

  void _changePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final _listPage = [
    const HomeScreen(),
    const ActivityScreen(),
    const NetworkScreen(),
    Consumer<GuestManager>(builder: (context, value, child) {
      return ProfileScreen(manager: value);
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: _listPage[_selectedPage],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Activies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Network',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: const Color.fromARGB(255, 23, 47, 69),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changePage,
      ),
    );
  }
}
