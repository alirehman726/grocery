import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/pages/Login_Page/widget/signin.dart';
import 'package:main_grocery/routes/route_names.dart';

class IntroWidget extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  final image;
  final type;
  final String title;
  final String subtitle;

  final int index;

  const IntroWidget(
      {Key key,
      @required this.screenWidth,
      @required this.screenHeight,
      @required this.index,
      this.image,
      this.type,
      this.title,
      this.subtitle})
      : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  getPosition() {
    return this.widget.index;
  }

  @override
  void initState() {
    super.initState();
  }

  doOpenHomePage() {
    Navigator.pushReplacementNamed(context, dashboardRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            widget.image,
            height: ScreenUtil().setHeight(230.0),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30.0),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14.0),
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
                doGetGetStartedButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  doGetGetStartedButton() {
    if (widget.index == 2) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(55.0),
          ),
          SizedBox(
            width: double.infinity,
            height: ScreenUtil().setHeight(60.0),
            child: FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                );
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(16.0),
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).backgroundColor),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).backgroundColor,
                      width: 2,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(3.0)),
            ),
          )
        ],
      );
    } else {
      return Column();
    }
  }
}
