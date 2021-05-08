import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/Login_Page/widget/profile.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    var bottomComponentHeight = ScreenUtil().setHeight(100);
    // ScreenUtil.init(context, width: 412, height: 870);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).accentColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Image.asset('assets/images/back.png'),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/Login/background.png'),
              height: ScreenUtil().setHeight(700),
              width: ScreenUtil().setWidth(412),
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Change your',
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
                    'Password',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(50)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 14, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Old Password',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: ScreenUtil().setSp(14),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 4.0, color: Colors.black12)
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: ' Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: BorderSide.none),
                            hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                            ),
                            // isDense: true, // Added this
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 14, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'New Password',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: ScreenUtil().setSp(14),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 4.0, color: Colors.black12)
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: ' New Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: BorderSide.none),
                            hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                            ),
                            // isDense: true, // Added this
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 14, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: ScreenUtil().setSp(14),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 4.0, color: Colors.black12)
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: ' Confirm Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: BorderSide.none),
                            hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                            ),
                            // isDense: true, // Added this
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: bottomComponentHeight,
        child: Row(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
              // color: Colors.yellow,
              width: MediaQuery.of(context).size.width * 1.0,
              child: RaisedButton(
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    'RESET PASSWORD',
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
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
