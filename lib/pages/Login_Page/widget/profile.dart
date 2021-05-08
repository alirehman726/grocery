import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/bottomnavigation.dart';

import 'changepassword.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 412, height: 870);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).accentColor,
          title: Container(
            alignment: Alignment.centerRight,
            child: IconButton(
                icon: Text(
                  'SKIP',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigation(),
                    ),
                  );
                }),
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/Login/background.png'), 
              width: ScreenUtil().setWidth(412),
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 10,
              ),
              child: Text(
                'My Profile',
                style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 60),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 140,
                            width: 140,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              backgroundImage: AssetImage(
                                  'assets/images/Profile/my_profile.png'),
                            ),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Profile/profile_broder.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 95,
                          left: 70,
                          child: FlatButton(
                            onPressed: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/Profile/edit.png',
                                    ),
                                    fit: BoxFit.cover),
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Personal Information',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(14)),
                      ),
                    ),
                    //1
                    Container(
                      padding: EdgeInsets.only(top: 14, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'First Name',
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
                                BoxShadow(
                                    blurRadius: 4.0, color: Colors.black12)
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter First Name',
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
                    //2
                    Container(
                      padding: EdgeInsets.only(top: 14, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Last Name',
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
                                BoxShadow(
                                    blurRadius: 4.0, color: Colors.black12)
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Last Name',
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
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 14, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Contact',
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
                                BoxShadow(
                                    blurRadius: 4.0, color: Colors.black12)
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Contact Number',
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
                    //5
                    Container(
                      padding: EdgeInsets.only(top: 14, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Address',
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
                                BoxShadow(
                                    blurRadius: 4.0, color: Colors.black12)
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Address',
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
                    //5
                    Container(
                      padding: EdgeInsets.only(top: 14, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'DOB',
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
                                BoxShadow(
                                    blurRadius: 4.0, color: Colors.black12)
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'DD/MM/YYYY',
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

                    //6
                    Container(
                      padding: EdgeInsets.only(top: 14, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'Login Information',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenUtil().setSp(14),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Email',
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
                                BoxShadow(
                                    blurRadius: 4.0, color: Colors.black12)
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Email',
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
                    //7
                    Container(
                      padding: EdgeInsets.only(
                        top: 14,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
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
                                BoxShadow(
                                    blurRadius: 4.0, color: Colors.black12)
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangePassword(),
                                ),
                              );
                            },
                            child: Text(
                              'Change Password',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              // color: Colors.yellow,
              width: MediaQuery.of(context).size.width * 1.0,
              child: RaisedButton(
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    'Update',
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigation(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
