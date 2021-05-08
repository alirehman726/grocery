import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/Installation_Page/widget/installing_page2.dart';
import 'package:main_grocery/pages/Login_Page/widget/signin.dart';

class InstallingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 412, height: 870);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 60),
                    child: Image(
                      image: AssetImage(
                          'assets/images/installation/installation_1.png'),
                      width: ScreenUtil().setWidth(280),
                      height: ScreenUtil().setHeight(231),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      'Fresh Food',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12, left: 19, right: 19),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[Text('.')],
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstallingPage2(),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Text(
                    'NEXT',
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Image(
                    height: 25,
                    width: 20,
                    image: AssetImage(
                        'assets/images/installation/installation_next.png'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
