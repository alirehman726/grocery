import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/address_modal.dart';
import 'package:main_grocery/models/order_modal.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/Address/add_address.dart';

class DeliveryAddress extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
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
                          Navigator.pop(context);
                        },
                      ),
                      expandedHeight: expandedHeight,
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
                            fontSizeAppTitle = 40;
                          }

                          return Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 0.0, top: 10.0),
                                child: Transform.translate(
                                  child: Text(
                                    'Address',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
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

                    // Card Item List
                    SliverPadding(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                            _buildListOrder(addressItems)),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddAddress(),
                      ),
                    );
                  },
                  child: Text(
                    "add address".toUpperCase(),
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

  List<Widget> _buildListOrder(List<Address> orderItems) {
    List<Widget> items = List();
    for (int i = 0; i < orderItems.length; i++) {
      Address item = orderItems[i];
      items.add(
        Container(
          height: ScreenUtil().setHeight(170.0),
          padding:
              EdgeInsets.only(left: 20.0, top: 16.0, bottom: 16.0, right: 16.0),
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
                      item.name,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(10.0),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20.0),
                    ),
                    Text(
                      item.address,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14.0),
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                flex: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Container(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                          value: 'one',
                          activeColor: Theme.of(context).backgroundColor,
                          groupValue: _radioValue,
                          onChanged: radioButtonChanges,
                        )),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Theme.of(context).backgroundColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return items;
  }
}
