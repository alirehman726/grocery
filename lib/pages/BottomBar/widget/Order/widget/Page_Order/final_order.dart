import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/bottomnavigation.dart';

class FinalOrder extends StatefulWidget {
  @override
  _FinalOrderState createState() => _FinalOrderState();
}

class _FinalOrderState extends State<FinalOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/full_background.png'),
            width: ScreenUtil().setWidth(412),
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/final_order.png'),
                SizedBox(
                  height: ScreenUtil().setHeight(33.0),
                ),
                Text(
                  'Thank you for order!',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(30.0)),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(16.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: ScreenUtil().setSp(90.0),
                  padding: EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
                  child: FlatButton(
                    padding: EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 17.0, bottom: 17.0),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigation(),
                        ),
                      );
                    },
                    child: Text(
                      'BACK TO HOME'.toUpperCase(),
                      style: TextStyle(
                        // color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(16.0),
                      ).copyWith(
                          fontSize: ScreenUtil().setSp(14.0),
                          color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
