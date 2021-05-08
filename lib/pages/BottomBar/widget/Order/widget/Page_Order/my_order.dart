import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/widget/Order/widget/Page_Order/track_order.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
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
            child: showListView(),
          )
        ],
      ),
    );
  }

  Widget showListView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            "My Orders",
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(30.0),
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 0),
                  blurRadius: 4.0,
                )
              ],
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => OrderItemCard(),
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1.0,
                );
              },
              itemCount: 20,
            ),
          ),
        )
      ],
    );
  }
}

class OrderItemCard extends StatefulWidget {
  @override
  _OrderItemCardState createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  bool isRated = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TrackOrder(),
            ));
      },
      child: Container(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
        height: ScreenUtil().setHeight(108.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Order#: 3652002',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(12)),
                ),
                InkWell(
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Order Detail will opened!'),
                    ));
                  },
                  child: Image.asset(
                    'assets/images/arrow-Next.png',
                    height: ScreenUtil().setSp(11.0),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(5.0),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '20 - Dec - 2020, 3:00 PM',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                    fontWeight: FontWeight.normal,
                    fontSize: ScreenUtil().setSp(12),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Confirmed',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(12.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      (isRated) ? 'You Rated' : 'No Rating',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(12)),
                    ),
                    // SizedBox(
                    //   height: ScreenUtil().setHeight(3.0),
                    // ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: ScreenUtil().setHeight(20),
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: ScreenUtil().setHeight(20),
                        ),
                        Icon(
                          Icons.star_border,
                          color: Theme.of(context).primaryColor,
                          size: ScreenUtil().setHeight(20),
                        ),
                        Icon(
                          Icons.star_border,
                          color: Theme.of(context).primaryColor,
                          size: ScreenUtil().setHeight(20),
                        ),
                        Icon(
                          Icons.star_border,
                          color: Theme.of(context).primaryColor,
                          size: ScreenUtil().setHeight(20),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
