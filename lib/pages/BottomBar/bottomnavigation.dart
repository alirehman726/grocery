import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/widget/Category/category.dart';
import 'package:main_grocery/pages/BottomBar/widget/Order/Order_page.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/profile_menu.dart';

import 'widget/HomePage/homepage.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  List<Widget> _children = [
    HomePage(),
    Category(),
    OrderPage(),
    ProfileMenu(),
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Nav_Bar/home.png'),
              color: Colors.white,
            ),
            title: Text(
              'HOME',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Nav_Bar/category.png'),
              color: Colors.white,
            ),
            title: Text(
              'CATEGORIES',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Nav_Bar/cart.png'),
              color: Colors.white,
            ),
            title: Text(
              'ORDERS',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Nav_Bar/user.png'),
              color: Colors.white,
            ),
            title: Text(
              'PROFILE',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(14)),
            ),
          ),
        ],
      ),
    );
  }
}
