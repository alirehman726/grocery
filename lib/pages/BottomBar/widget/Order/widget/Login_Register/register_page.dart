import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/widget/Order/widget/Page_Order/my_order.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(30),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(bottom: 50, left: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/ig_background.png'),
            width: ScreenUtil().setWidth(412),
            fit: BoxFit.fill,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.all(20.0),
            child: doShowRegisterContainer(),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.only(left: 20.0, top: 100.0, bottom: 10.0),
            child: doShowDetail(),
          )
        ],
      ),
    );
  }

  Widget doShowRegisterContainer() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(100.0),
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Positioned(
                top: 0.0,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(30.0)),
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(35.0),
                child: Text(
                  'Grocery App',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(40.0)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget doShowDetail() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(25.0),
            ),
            Text(
              'Personal Information',
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(12.0),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10.0),
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
                        BoxShadow(blurRadius: 10.0, color: Colors.black12)
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
                        BoxShadow(blurRadius: 10.0, color: Colors.black12)
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
                        BoxShadow(blurRadius: 10.0, color: Colors.black12)
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Contact',
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

            //4
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
                        BoxShadow(blurRadius: 10.0, color: Colors.black12)
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

            SizedBox(
              height: ScreenUtil().setHeight(25.0),
            ),

            //Login Information
            Text(
              'Login Information',
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(12.0),
              ),
            ),

            //5
            Container(
              padding: EdgeInsets.only(top: 14, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                        BoxShadow(blurRadius: 10.0, color: Colors.black12)
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

            //6
            Container(
              padding: EdgeInsets.only(top: 14, right: 20),
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
                        BoxShadow(blurRadius: 10.0, color: Colors.black12)
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

            //7
            Container(
              padding: EdgeInsets.only(top: 14, right: 20),
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
                        BoxShadow(blurRadius: 10.0, color: Colors.black12)
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Confirm Password',
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

            SizedBox(
              height: ScreenUtil().setHeight(30.0),
            ),

            //Botton
            Container(
              padding: EdgeInsets.only(right: 20.0),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: () {
                  print('Click to Sign In');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyOrder(),
                      ));
                },
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Register'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setHeight(14.0),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(3.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
