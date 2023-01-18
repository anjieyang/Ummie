import 'package:flutter/material.dart';
import 'package:ummie/CONSTANT.dart';
import 'package:ummie/IdeaPage.dart';
import 'package:ummie/MessagePage.dart';
import 'package:ummie/ProfilePage.dart';
import 'package:ummie/Ummicons_icons.dart';
import 'package:ummie/HomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Ummie());
}

class Ummie extends StatelessWidget {
  const Ummie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Ummie',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: child,
        );
      },
      child: const UmmieNavigationBar(),
    );
  }
}

class UmmieNavigationBar extends StatefulWidget {
  const UmmieNavigationBar({Key? key}) : super(key: key);

  @override
  State<UmmieNavigationBar> createState() => _UmmieNavigationBarState();
}

class _UmmieNavigationBarState extends State<UmmieNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const IdeasPage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Ummicons.home, color: Colors.black, size: 28,),
              activeIcon: Icon(Ummicons.home_filled, color: THEMECOLOR, size: 28,),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: const Icon(Ummicons.idea, color: Colors.black, size: 28,),
              activeIcon: Icon(Ummicons.idea_filled, color: THEMECOLOR, size: 28,),
              label: 'Idea'),
          BottomNavigationBarItem(
              icon: const Icon(Ummicons.message, color: Colors.black, size: 28,),
              activeIcon: Icon(Ummicons.message_filled, color: THEMECOLOR, size: 28,),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: const Icon(Ummicons.user, color: Colors.black, size: 28,),
              activeIcon: Icon(Ummicons.user_filled, color: THEMECOLOR, size: 28,),
              label: 'Profile'),
        ],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}