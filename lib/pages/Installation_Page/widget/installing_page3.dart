import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/Login_Page/widget/signin.dart';

class InstallingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 412, height: 870);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 110),
                    child: Image(
                      image: AssetImage(
                          'assets/images/installation/installation_3.png'),
                      width: ScreenUtil().setWidth(280),
                      height: ScreenUtil().setHeight(231),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      'Easy Payment',
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
                  Container(
                    width: (MediaQuery.of(context).size.width * 1.0),
                    padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                        side: BorderSide(
                          color: Theme.of(context).backgroundColor,
                          width: ScreenUtil().setWidth(2),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: Text(
                          'GET STARTED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).backgroundColor,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
