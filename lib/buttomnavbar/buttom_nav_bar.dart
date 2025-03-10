import 'package:ess_mobile/pages/home/home_page_new.dart';
import 'package:ess_mobile/pages/kay/uji_coba.dart';
import 'package:ess_mobile/pages/notification/notification_page.dart';
import 'package:ess_mobile/pages/profile/profile_page_new.dart';
import 'package:ess_mobile/themes.dart';
import 'package:flutter/material.dart';


class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _selectedIndex = 0;

  final _screens = [
    // mydevlopment(),
    HomePageNew(),
    Notifi(),
    // NotificationPage(),
    UjiCoba(),
    // KayPage(),
    // ProfilePage(),
    ProfileNew(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget customNavBar() {
      return Container(
        decoration: BoxDecoration(
        
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (i) => setState(() {
            _selectedIndex = i;
          }),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: bottomNavText,
          // unselectedLabelStyle: bottomNavText,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(
                    'assets/icons/Icon-home.png',
                    width: 21,
                    color: _selectedIndex == 0 ? darkblueColor : greyColor,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(
                    'assets/icons/notification.png',
                    width: 24,
                    color: _selectedIndex == 1 ? darkblueColor : greyColor,
                  ),
                ),
                label: 'NOTIFICATION'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(
                    'assets/icons/lock (1).png',
                    width: 25,
                    color: _selectedIndex == 2 ? darkblueColor : greyColor,
                  ),
                ),
                label: 'KUNCI'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(
                    'assets/icons/user (8).png',
                    width: 27,
                    color: _selectedIndex == 3 ? darkblueColor : greyColor,
                  ),
                ),
                label: 'PROFILE'),
            // BottomNavigationBarItem(
            //     icon: Container(
            //       margin: EdgeInsets.symmetric(vertical: 10),
            //       child: Image.asset(
            //         'assets/icons/icon-menu.png',
            //         width: 20,
            //         color: _selectedIndex == 4 ? redColor : greyColor,
            //       ),
            //     ),
            //     label: 'MENU'),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: customNavBar(),
      body: _screens[_selectedIndex],
      backgroundColor: Colors.white,
    );
  }
}