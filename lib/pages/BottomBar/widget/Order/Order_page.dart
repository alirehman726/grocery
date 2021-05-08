import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/pages/BottomBar/widget/Order/widget/Login_Register/login_page.dart';
import 'package:main_grocery/pages/BottomBar/widget/Order/widget/Login_Register/register_page.dart'; 

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Text(
                'Orders',
                style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      print('Clicked To Profile');
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: ScreenUtil().setHeight(40),
                      width: ScreenUtil().setHeight(40),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        backgroundImage:
                            AssetImage('assets/images/Profile/my_profile.png'),
                      ),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/Profile/profile_broder.png"),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Click To Cart');
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(30),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 5, left: 20),
                      child: Image.asset('assets/images/AppBar/cart.png'),
                    ),
                  ),
                ],
              ),
            )
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
            child: doShowLoginContainer(),
          ),
        ],
      ),
    );
  }

  Widget doShowLoginContainer() {
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
                  'Login',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(26.0)),
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(35.0),
                child: Text(
                  'Requried',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(40.0)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(15.0),
        ),
        Text(
          'Please signing or signup to continue check your orders status and history.',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setSp(16.0)),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(30.0),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: FlatButton(
                onPressed: () {
                  print('Click to SignUp');

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                },
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 17.0, top: 17.0),
                highlightColor: Theme.of(context).accentColor,
                child: Text(
                  'Sign Up'.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(14.0)),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).backgroundColor,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(3.0)),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(20.0),
            ),
            Expanded(
              flex: 5,
              child: FlatButton(
                onPressed: () {
                  print('Click to Sign In');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 17.0, bottom: 17.0),
                color: Theme.of(context).backgroundColor,
                child: Text(
                  'Sign In'.toUpperCase(),
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
        )
      ],
    );
  }
}
