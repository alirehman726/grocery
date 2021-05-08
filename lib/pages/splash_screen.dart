import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/pages/BottomBar/bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Installation_Page/pageviewdemo.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavigation(),
        ),
      );
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => PageViewDemo(),
        ),
      );
    }
  }

  get appTitleTextStyle => null;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), checkFirstSeen);
  }

  // void navigateToLogin() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => PageViewDemo(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 412, height: 870);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: <Widget>[
            Image(
              image: AssetImage(
                'assets/images/spalsh/splash_background.png',
              ),
              width: ScreenUtil().setWidth(425),
              // width: ScreenUtil().setWidth(425),
              height: ScreenUtil().setHeight(860),
              fit: BoxFit.fill,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // SvgPicture.asset('assets/images/splash.png'),
                  Image(
                    image: AssetImage('assets/images/spalsh/logo.png'),
                    width: ScreenUtil().setWidth(134),
                    height: ScreenUtil().setHeight(137),
                  ),
                  // SvgPicture.asset(
                  //   'assets/images/svg1.svg',
                  //   width: ScreenUtil().setWidth(114),
                  //   height: ScreenUtil().setHeight(137),
                  // ),

                  SizedBox(
                    height: 5.7,
                  ),
                  Text(
                    'Grocery App',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(50)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ScreenUtil().setSp(100),
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
