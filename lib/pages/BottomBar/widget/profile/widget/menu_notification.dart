import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/address_modal.dart';
import 'package:main_grocery/models/order_modal.dart';

class MenuNotification extends StatefulWidget {
  @override
  _MenuNotificationState createState() => _MenuNotificationState();
}

class _MenuNotificationState extends State<MenuNotification> {
  bool isSwitched = false;
  bool isSwitched1 = false;
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/My_Wishlist_1.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width,
            child: CustomScrollView(
              controller: _scrollControler,
              physics: AlwaysScrollableScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).accentColor,
                  elevation: 0,
                  pinned: true,
                  floating: true,
                  snap: true,
                  leading: IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/back.png'),
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  expandedHeight: expandedHeight,
                  actions: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            height: 40,
                            width: 40,
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
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 5, left: 20),
                            child: Image.asset(
                                'assets/images/AppBar/cart.png'),
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
                                'Notifications',
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

                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 30, left: 20, right: 20, bottom: 20),
                    child: Text(
                      'Notification Preferences',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                //Mobile Notification
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    isSwitched = value;
                                    print(isSwitched);
                                  },
                                );
                              },
                              activeTrackColor:
                                  Theme.of(context).primaryColor,
                              activeColor: Colors.green,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'Mobile Notification',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: ScreenUtil().setSp(14)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // email Notification
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Switch(
                              value: isSwitched1,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched1 = value;
                                  print(isSwitched1);
                                });
                              },
                              activeTrackColor:
                                  Theme.of(context).primaryColor,
                              activeColor: Colors.green,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'Email Notification',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: ScreenUtil().setSp(14)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //clear
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 20,
                    ),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'CLEAR',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(14)),
                    ),
                  ),
                ),
                // Card Item List
                SliverPadding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                        _buildListOrder(addressItems)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildListOrder(List<Address> orderItems) {
    List<Widget> items = List();
    for (int i = 0; i < orderItems.length; i++) {
      items.add(
        Container(
          // height: ScreenUtil().setHeight(130.0),
          padding:
              EdgeInsets.only(left: 20.0, top: 16.0, bottom: 16.0, right: 20.0),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Colors.black12,
              offset: Offset(0, 0),
            )
          ]),
          margin: EdgeInsets.only(bottom: 1.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12.0),
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(15.0),
                    ),
                    Text(
                      '24th August 2020, 03:30 PM',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(10.0),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20.0),
                    ),
                  ],
                ),
                flex: 8,
              ),
            ],
          ),
        ),
      );
    }

    return items;
  }
}
