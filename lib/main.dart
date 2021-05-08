import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:main_grocery/routes/custome_route.dart';
import 'package:main_grocery/routes/route_names.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:after_layout/after_layout.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      checkerboardRasterCacheImages: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primaryColor: Color(0Xff01402E),
        backgroundColor: Color(0xffF2A516),
        accentColor: Color(0XffFAECD2),
        fontFamily: 'Montserrat',
      ),
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: splashScreen,
    );
  }
}
