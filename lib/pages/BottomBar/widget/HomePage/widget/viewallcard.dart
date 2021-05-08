import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/pages/BottomBar/widget/Category/widget/view_page.dart';

class ViewAllCard extends StatefulWidget {
  @override
  _ViewAllCardState createState() => _ViewAllCardState();
}

class _ViewAllCardState extends State<ViewAllCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("View All Card Clicked");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewPage(),
          ),
        );
      },
      child: Container(
        width: ScreenUtil().setWidth(112),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 4.0, offset: Offset(0, 2.0)),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(70.0),
                    width: ScreenUtil().setWidth(60.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 0),
                              blurRadius: 4.0,
                              spreadRadius: 3.0)
                        ]),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15.0),
            ),
            Text(
              "View all".toUpperCase(),
              style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(12))
                  .copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
