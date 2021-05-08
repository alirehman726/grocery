import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/Login_Page/widget/profile.dart';
import 'package:main_grocery/pages/Login_Page/widget/signin.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var firstComponentHeight = ScreenUtil().setHeight(191);
  var bottomComponentHeight = ScreenUtil().setHeight(110);

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 412, height: 870);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/Login/background.png'),
                  height: ScreenUtil().setHeight(850),
                  width: ScreenUtil().setWidth(412),
                  fit: BoxFit.fill,
                ),
                Positioned(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 20),
                        child: IconButton(
                            icon: Image.asset('assets/images/back.png'),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ));
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 35),
                        child: Text(
                          'OTP',
                          style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(30),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Verification',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(50),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 22, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    cursorColor: Theme.of(context).primaryColor,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      hoverColor:
                                          Theme.of(context).primaryColor,
                                      fillColor: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    cursorColor: Theme.of(context).primaryColor,
                                    obscureText: true,
                                    decoration: InputDecoration(),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    cursorColor: Theme.of(context).primaryColor,
                                    obscureText: true,
                                    decoration: InputDecoration(),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    cursorColor: Theme.of(context).primaryColor,
                                    obscureText: true,
                                    decoration: InputDecoration(),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Didn’t receive the OTP?',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: ScreenUtil().setSp(12),
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Resend again',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: ScreenUtil().setSp(12),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 1.0,
                        child: RaisedButton(
                          child: Padding(
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            child: Text(
                              'CONFIRM',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//obscureText: true,
