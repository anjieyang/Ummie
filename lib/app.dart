import 'package:flutter/material.dart';
import 'package:ummie/config/config.dart';
import 'package:ummie/config/ummicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ummie/pages/home/home.dart';
import 'package:ummie/pages/ideas/ideas.dart';
import 'package:ummie/pages/message/message.dart';
import 'package:ummie/pages/profile/profile.dart';
import 'pages/authentication/view/view.dart';



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
            splashFactory: NoSplash.splashFactory,
            primarySwatch: Colors.green,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: Colors.white,
          ),
          // home: child,
          home: LoginPage(),
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
  final PageController pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const IdeasPage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // body: _pages[_selectedIndex],
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Ummicons.home, color: Colors.black, size: 28,),
              activeIcon: Icon(Ummicons.home_filled, color: themeColor, size: 28,),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: const Icon(Ummicons.idea, color: Colors.black, size: 28,),
              activeIcon: Icon(Ummicons.idea_filled, color: themeColor, size: 28,),
              label: 'Idea'),
          BottomNavigationBarItem(
              icon: const Icon(Ummicons.message, color: Colors.black, size: 28,),
              activeIcon: Icon(Ummicons.message_filled, color: themeColor, size: 28,),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: const Icon(Ummicons.user, color: Colors.black, size: 28,),
              activeIcon: Icon(Ummicons.user_filled, color: themeColor, size: 28,),
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