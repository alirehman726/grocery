import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/widget/Order/widget/Page_Order/my_cart.dart';
import 'package:main_grocery/pages/BottomBar/widget/Order/widget/Page_Order/my_order.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  var middleComponentHeight = ScreenUtil().setHeight(100);
  var bottomComponentHeight = ScreenUtil().setHeight(100);
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
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/back.png'),
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyOrder(),
                      ));
                },
              ),
            ),
            Row(
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
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
            height: middleComponentHeight,
            width: MediaQuery.of(context).size.width * 1.0,
            child: Text(
              'Track Order',
              style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(30)),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.only(
                top: middleComponentHeight, left: 20, right: 20, bottom: 70),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              child: Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 36,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Order#: 3652002',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(12)),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.black26,
                      ),
                      Container(
                        height: 124,
                        width: MediaQuery.of(context).size.width * 1.0,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        // color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //=============================1============================//
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Strawberry',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(14)),
                                    ),
                                    Text(
                                      '01 KG',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .backgroundColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(10)),
                                    )
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '₹ 50  x  05',
                                        style: TextStyle(
                                            color: Colors.black
                                                .withOpacity(0.5)
                                                .withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: ScreenUtil().setSp(12)),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '₹ 250',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).backgroundColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(16)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            //=============================2============================//
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Banana',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(14)),
                                    ),
                                    Text(
                                      '01 Dozen',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .backgroundColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(10)),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '₹ 20  x  02',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontWeight: FontWeight.normal,
                                          fontSize: ScreenUtil().setSp(12)),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '₹ 40',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).backgroundColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(16)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            //=============================3============================//
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                          fontSize: ScreenUtil().setSp(12)),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '₹ 290',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(16)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.black26,
                      ),
                      ListTile(
                        title: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ExpansionTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Track Order',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(12)),
                                  ),
                                  // Icon(
                                  //   Icons.replay,
                                  //   color: Theme.of(context).primaryColor,
                                  // ),
                                ],
                              ),
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //__1__Order Placed
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: ScreenUtil().setWidth(10),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .backgroundColor,
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                                'assets/images/track_order/track_order_1.png'),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setSp(30.0),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Order Placed',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      ScreenUtil().setSp(14),
                                                ),
                                              ),
                                              Text(
                                                'We have received your order on \n29th  December 2020',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(10)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 32.0),
                                        alignment: Alignment.centerLeft,
                                        child: Dash(
                                          direction: Axis.vertical,
                                          dashThickness: 2,
                                          length: 70,
                                          dashLength: 50,
                                          dashColor:
                                              Theme.of(context).backgroundColor,
                                        ),
                                      ),

                                      //__2__Order Confirmed
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: ScreenUtil().setWidth(10),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .backgroundColor,
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                                'assets/images/track_order/track_order_2.png'),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setSp(30.0),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Order Confirmed',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      ScreenUtil().setSp(14),
                                                ),
                                              ),
                                              Text(
                                                'We has been confirmed on \n29th December 2020',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(10)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 32.0),
                                        alignment: Alignment.centerLeft,
                                        child: Dash(
                                          direction: Axis.vertical,
                                          dashThickness: 2,
                                          length: 70,
                                          dashLength: 50,
                                          dashColor:
                                              Theme.of(context).backgroundColor,
                                        ),
                                      ),

                                      //__3__Order Processed
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: ScreenUtil().setWidth(10),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                                'assets/images/track_order/track_order_3.png'),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setSp(30.0),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Order Processed',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      ScreenUtil().setSp(14),
                                                ),
                                              ),
                                              Text(
                                                'We are preparing your order',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(10)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 32.0),
                                        alignment: Alignment.centerLeft,
                                        child: Dash(
                                          direction: Axis.vertical,
                                          length: 70,
                                          dashLength: 10,
                                          dashColor: Colors.grey,
                                        ),
                                      ),

                                      //__4__Ready to Ship
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: ScreenUtil().setWidth(10),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .backgroundColor,
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                                'assets/images/track_order/track_order_4.png'),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setSp(30.0),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Ready to Ship',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      ScreenUtil().setSp(14),
                                                ),
                                              ),
                                              Text(
                                                'Your order is ready for shipping',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(10)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 32.0),
                                        alignment: Alignment.centerLeft,
                                        child: Dash(
                                          direction: Axis.vertical,
                                          length: 70,
                                          dashLength: 10,
                                          dashColor: Colors.grey,
                                        ),
                                      ),

                                      //__5__Out for Delivery
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: ScreenUtil().setWidth(10),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .backgroundColor,
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                                'assets/images/track_order/track_order_5.png'),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setSp(30.0),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Out for Delivery',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      ScreenUtil().setSp(14),
                                                ),
                                              ),
                                              Text(
                                                'Your order is out for delivery',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(10)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(20.0),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.only(
                            left: 20, right: 10, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Delivery Information',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(14)),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Abidhusain Chidi',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'C-232, Siddhi Vinayak, Near Kataria arcade, Ahmedabad',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'abidindia009@gmail.com | +91-9033870071',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.black26,
                      ),
                      Container(
                        height: 120,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Payment Information',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(12)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Cash on Delivery',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: ScreenUtil().setSp(10)),
                                ),
                                // SizedBox(height: ScreenUtil().setHeight(20.0),),
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFDEDEDE),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        height: 50,
                                        width: ScreenUtil().setWidth(321),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: <Widget>[
                                              Image.asset(
                                                  'assets/images/rocket.png'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Need support?',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: ScreenUtil()
                                                            .setSp(10)),
                                                  ),
                                                  Text(
                                                    'Raise Ticket here',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: ScreenUtil()
                                                            .setSp(10)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 0, top: 15),
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: RaisedButton(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          're-order'.toUpperCase(),
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
                              builder: (context) => MyCart(),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Offset p1, p2;

  MyPainter({Key key, this.p1, this.p2}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFF01402E)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, size.height / 1);
    Offset endingPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startingPoint, endingPoint, paint);

    // Color(0xFF01402E);
    // Size(0, 100);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
