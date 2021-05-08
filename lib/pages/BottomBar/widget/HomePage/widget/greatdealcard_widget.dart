 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/product_model.dart';

class GreatDealCard extends StatefulWidget {
  final ProductModel product;

  GreatDealCard({Key key, this.product}) : super(key: key);

  @override
  _GreatDealCardState createState() => _GreatDealCardState();
}

class _GreatDealCardState extends State<GreatDealCard> {
  bool isFavorite = false;
  bool isAddedCart = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Great Card Clicked --> " + widget.product.name);
      },
      child: Container(
        margin: EdgeInsets.only(left: 2.0, right: 13.0, bottom: 10.0),
        width: ScreenUtil().setWidth(112),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 4.0, offset: Offset(0, 2.0)),
          ],
          color: hexToColor(widget.product.bgColor),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 14.0),
                  // child: CachedNetworkImage(
                  //   imageUrl: widget.product.image[0],
                  //   fit: BoxFit.scaleDown,
                  //   height: ScreenUtil().setHeight(60.0),
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  // ),
                  child: Image.asset(
                    widget.product.image[0],
                    fit: BoxFit.scaleDown,
                    height: ScreenUtil().setHeight(60.0),
                    
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10.0),
                ),
                Text(
                  widget.product.name,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12.0),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.product.sizes[0].qty,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(10.0),
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(2.0),
                    ),
                    Text(
                      widget.product.sizes[0].sizeVal,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(10.0),
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.product.prices[0].symbol,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(20.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(1.0),
                    ),
                    Text(
                      widget.product.prices[0].price,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(20.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  width: ScreenUtil().setWidth(30.0),
                  height: ScreenUtil().setHeight(30.0),
                  padding: EdgeInsets.all(4.0),
                  child: Image.asset(
                    (isFavorite)
                        ? "assets/images/card/ic_fav.png"
                        : "assets/images/card/ic_unfav.png",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (!isAddedCart) {
                      isAddedCart = true;
                    }
                  });
                },
                child: Container(
                  width: ScreenUtil().setWidth(30.0),
                  height: ScreenUtil().setHeight(30.0),
                  padding: EdgeInsets.all(4.0),
                  child: Image.asset((isAddedCart)
                      ? "assets/images/card/ic_added_cart.png"
                      : "assets/images/card/ic_add_cart.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    return Color(int.parse(code, radix: 16) + 0xFF000000);
  }
}
