import 'package:flutter/material.dart';
import 'package:mindwave/features/home/presentation/view/bottom_navigation/about.dart';
import 'package:mindwave/features/home/presentation/view/bottom_navigation/home.dart';
import 'package:mindwave/features/home/presentation/view/bottom_navigation/notice.dart';
import 'package:mindwave/features/home/presentation/view/bottom_navigation/profile.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {

  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const HomeScreen(),
    const NoticeScreen(),
    const AboutScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.purple.shade900,
        centerTitle: true,
      ),

      body: lstBottomScreen [_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notice"),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: "About Us"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],

        backgroundColor: Colors.purple.shade900,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,

        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      
    );
  }
}