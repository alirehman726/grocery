import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/address_modal.dart';
import 'package:main_grocery/models/order_modal.dart';
import 'package:main_grocery/pages/BottomBar/widget/Order/widget/Page_Order/final_order.dart';
import 'package:main_grocery/pages/BottomBar/widget/Order/widget/Page_Order/track_order.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  String _radioValue;
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice);
    });
  }

  List<OrderModal> orders = OrderModal.fetchAll();
  List<Address> addressItems = Address.fetchAll();

  double expandedHeight = ScreenUtil().setHeight(150.0);
  double constraintHeight = ScreenUtil().setHeight(150.0);
  double fontSizeAppTitle = ScreenUtil().setSp(20.0);
  ScrollController _scrollControler;

  Color barColor = Color(0xFFFAECD2).withOpacity(0.0);

  @override
  void initState() {
    super.initState();
    _scrollControler = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // double mainContHeight =
    //     ScreenUtil().setHeight(MediaQuery.of(context).size.height) -
    //         ScreenUtil().setHeight(40.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/full_background.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    ScreenUtil().setHeight(104.0),
                child: CustomScrollView(
                  controller: _scrollControler,
                  physics: AlwaysScrollableScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      backgroundColor: barColor,
                      pinned: true,
                      floating: true,
                      snap: true,
                      leading: IconButton(
                        icon: ImageIcon(
                          AssetImage('assets/images/back.png'),
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrackOrder(),
                              ));
                        },
                      ),
                      expandedHeight: expandedHeight,
                      actions: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
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
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    backgroundImage: AssetImage(
                                        'assets/images/Profile/my_profile.png'),
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
                                  child: Image.asset(
                                      'assets/images/AppBar/cart.png'),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                      flexibleSpace: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          double percent =
                              ((constraints.maxHeight - kToolbarHeight) *
                                  150 /
                                  (expandedHeight));

                          double dx = 0;

                          dx = 100 - percent;

                          if (dx < 21) {
                            dx = 20;
                          } else if (dx >= 60) {
                            dx = 60;
                          }

                          double transPerc = 100 - percent;
                          transPerc = transPerc * 0.01;
                          String transPercStr = transPerc.toStringAsFixed(1);
                          transPerc = double.parse(transPercStr);

                          if (transPerc <= 0.3) {
                            transPerc = 0.0;
                          } else if (transPerc >= 0.6) {
                            transPerc = 1.0;
                          }

                          barColor = barColor.withOpacity(transPerc);

                          fontSizeAppTitle = (60 - dx);

                          if (fontSizeAppTitle < 21) {
                            fontSizeAppTitle = 21;
                          } else if (fontSizeAppTitle > 31) {
                            fontSizeAppTitle = 30;
                          }

                          return Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 0.0, top: 10.0),
                                child: Transform.translate(
                                  child: Text(
                                    'My Cart',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontSizeAppTitle),
                                  ),
                                  offset: Offset(dx,
                                      constraints.maxHeight - kToolbarHeight),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Cart Summary Title
                    SliverPadding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          "Cart Summary",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12.0),
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),

                    // Card Item List
                    SliverPadding(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                      sliver: SliverList(
                        delegate:
                            SliverChildListDelegate(_buildListOrder(orders)),
                      ),
                    ),

                    // Delivery Address Title
                    SliverPadding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          "Delivery Address",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12.0),
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),

                    // Payment Method Item List
                    SliverPadding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          height: ScreenUtil().setHeight(220.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: addressItems.map((item) {
                              return AddressCard(address: item);
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

                    // Payment Method Title
                    SliverPadding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          "Payment Method",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12.0),
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),

                    // Payment Method Item List
                    SliverPadding(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 4.0),
                      sliver: SliverList(
                        delegate:
                            SliverChildListDelegate(_buildListPaymentMethods()),
                      ),
                    ),
                  ],
                ),
              ),
              //Bottom Button
              Container(
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil().setHeight(85.0),
                padding: EdgeInsets.only(
                  top: 18.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: FlatButton(
                  padding: EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: 17.0,
                    bottom: 17.0,
                  ),
                  onPressed: () {
                    print("Confirm Order Clicked");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FinalOrder(),
                      ),
                    );
                  },
                  child: Text(
                    "Confirm Order".toUpperCase(),
                    style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(16.0))
                        .copyWith(
                            fontSize: ScreenUtil().setSp(14.0),
                            color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(3.0)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _buildListOrder(List<OrderModal> orderItems) {
    List<Widget> items = List();
    for (int i = 0; i < orderItems.length; i++) {
      OrderModal item = orderItems[i];
      items.add(
        Container(
          height: ScreenUtil().setHeight(130.0),
          padding:
              EdgeInsets.only(left: 10.0, top: 16.0, bottom: 16.0, right: 16.0),
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 1.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.0,
                        offset: Offset(0, 0),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                  height: ScreenUtil().setHeight(55.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Image.network(
                        item.productImage,
                      ),
                    ),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Strawberry",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14.0),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      "01 KG",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(10.0),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .backgroundColor
                              .withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20.0),
                    ),
                    Text(
                      "₹250",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(16.0),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).backgroundColor),
                    ),
                  ],
                ),
                flex: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0XFFDEDEDE),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.remove,
                            color: Theme.of(context).primaryColor,
                            size: 20.0,
                          ),
                          Text(
                            "01",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14.0),
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColor,
                            size: 20.0,
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
                flex: 2,
              ),
            ],
          ),
        ),
      );
    }

    // Item Total Amount
    items.add(
      Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0,
        ),
        color: Colors.white,
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
                  "Total",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12.0),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Text(
                  "₹ 2500",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14.0),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "(Total does not include shipping)",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(11.0),
                      fontWeight: FontWeight.normal,
                      color: Color(0XFFDEDEDE)),
                  textAlign: TextAlign.end,
                ),
              ],
            )
          ],
        ),
      ),
    );
    return items;
  }

  List<Widget> _buildListPaymentMethods() {
    List<Widget> items = List();
    items.add(
      Container(
        decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.black12, blurRadius: 0.0, offset: Offset(0, 0))
            // ],
            ),
        height: 105,
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                // color:
                //     _value ? Theme.of(context).backgroundColor : Colors.white,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Net Backing',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: ScreenUtil().setSp(14),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                          value: 'one',
                          activeColor: Theme.of(context).backgroundColor,
                          groupValue: _radioValue,
                          onChanged: radioButtonChanges,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color:
                //     _value0 ? Theme.of(context).backgroundColor : Colors.white,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Credit / Debit / ATM Card',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: ScreenUtil().setSp(14),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                          value: 'Two',
                          activeColor: Theme.of(context).backgroundColor,
                          groupValue: _radioValue,
                          onChanged: radioButtonChanges,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return items;
  }
}

class AddressCard extends StatefulWidget {
  final Address address;

  AddressCard({Key key, this.address}) : super(key: key);

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  List<Address> addressItems = Address.fetchAll();

  String _radioValue;
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;

        default:
          choice = null;
      }
      debugPrint(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      margin: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(180.0),
      height: ScreenUtil().setHeight(180.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.address.address,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.normal,
                fontSize: ScreenUtil().setSp(12.0)),
          ),
          SizedBox(
            height: ScreenUtil().setSp(20.0),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontWeight: FontWeight.normal,
                    fontSize: ScreenUtil().setSp(12.0),
                  ),
                ),
                Radio(
                  value: widget.address.id,
                  activeColor: Theme.of(context).backgroundColor,
                  groupValue: _radioValue,
                  onChanged: radioButtonChanges,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
