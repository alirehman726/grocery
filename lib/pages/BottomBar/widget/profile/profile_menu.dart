import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
 
import 'package:main_grocery/models/profile.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/Address/delivery_Address.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/Help/help.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/menu_condition.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/menu_notification.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/menu_profile.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/menu_wishlist.dart';

class ProfileMenu extends StatefulWidget {
  final Profile profile;
  final Function press;
  const ProfileMenu({Key key, this.profile, this.press}) : super(key: key);

  @override
  _ProfileMenuState createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 412, height: 870);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.9),
        child: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
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
                Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Image.asset('assets/images/AppBar/cart.png'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/Login/background.png'),
            height: ScreenUtil().setHeight(850),
            width: ScreenUtil().setWidth(412),
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 14),
                child: Text(
                  'Menu',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(40)),
                ),
              ),
              //1
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  color: Colors.white,
                  // padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      //1
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuProfile(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child:
                                Image.asset('assets/images/Menu/profile.png'),
                          ),
                          title: Text(
                            'My Profile',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                      ),
                      Divider(height: 5, color: Colors.black),
                      //2
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuWishList(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child:
                                Image.asset('assets/images/Menu/wishlist.png'),
                          ),
                          title: Text(
                            'My Wishlist',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                      ),
                      Divider(height: 5, color: Colors.black),
                      //3
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeliveryAddress(),
                              ));
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child:
                                Image.asset('assets/images/Menu/address.png'),
                          ),
                          title: Text(
                            'My Address',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                      ),
                      Divider(height: 5, color: Colors.black),
                      //4
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuNotification(),
                              ));
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Image.asset(
                                'assets/images/Menu/notification.png'),
                          ),
                          title: Text(
                            'Notifications',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                      ),
                      Divider(height: 5, color: Colors.black),
                      //5
                      FlatButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //     'Conditions', (Route<dynamic> route) => false);
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Image.asset('assets/images/Menu/rate.png'),
                          ),
                          title: Text(
                            'Rate Us',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                      ),
                      Divider(height: 5, color: Colors.black),
                      //6
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuCondition(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child:
                                Image.asset('assets/images/Menu/condition.png'),
                          ),
                          title: Text(
                            'Terms & Conditions',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                      ),
                      Divider(height: 5, color: Colors.black),
                      //7
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Help(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Image.asset('assets/images/Menu/help.png'),
                          ),
                          title: Text(
                            'Help & Support',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
