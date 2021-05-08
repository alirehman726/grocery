import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/category.dart'; 

class CategoryDealCard extends StatefulWidget {
  final CategoryModel category;

  CategoryDealCard({Key key, this.category}) : super(key: key);

  @override
  _CategoryDealCardState createState() => _CategoryDealCardState();
}

class _CategoryDealCardState extends State<CategoryDealCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Category Deal Card Clicked --> " + widget.category.deal);
      },
      child: Container(
        margin: EdgeInsets.only(left: 2.0, right: 8.0, bottom: 10.0),
        width: ScreenUtil().setWidth(120.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: ScreenUtil().setWidth(25.0),
              right: ScreenUtil().setWidth(25.0),
              bottom: ScreenUtil().setHeight(15.0),
              top: ScreenUtil().setHeight(15.0),
              child: Container(
                width: ScreenUtil().setWidth(70.0),
                height: ScreenUtil().setHeight(70.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  widget.category.image,
                  height: ScreenUtil().setHeight(40.0),
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              height: ScreenUtil().setHeight(40.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                        offset: Offset(0, 4)),
                  ],
                ),
                padding: EdgeInsets.only(bottom: 8.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.category.name,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12.0),
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(
              right: 15.0,
              // top: 1.0,
              child: Container(
                width: ScreenUtil().setWidth(40.0),
                height: ScreenUtil().setHeight(45.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                  widget.category.deal,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12.0),
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
