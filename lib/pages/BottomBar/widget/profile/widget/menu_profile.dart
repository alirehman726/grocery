import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/pages/Login_Page/widget/changepassword.dart';

class MenuProfile extends StatefulWidget {
  @override
  _MenuProfileState createState() => _MenuProfileState();
}

class _MenuProfileState extends State<MenuProfile> {
  double expandedHeight = ScreenUtil().setHeight(150.0);
  double fontSizeAppTitle = ScreenUtil().setSp(20.0);
  ScrollController _scrollController;

  Color barColor = Color(0xFFFAECD2).withOpacity(0.0);
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
          CustomScrollView(
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              //AppBar
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
                    margin: EdgeInsets.only(right: 10.0),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5.0),
                          child: Image.asset(
                            'assets/images/AppBar/cart.png',
                            height: ScreenUtil().setHeight(40),
                            width: ScreenUtil().setHeight(40),
                          ),
                        )
                      ],
                    ),
                  )
                ],
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percent = ((constraints.maxHeight - kToolbarHeight) *
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
                              'My Profile',
                              style: TextStyle(
                                  color: Theme.of(context).backgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSizeAppTitle),
                            ),
                            offset: Offset(
                                dx, constraints.maxHeight - kToolbarHeight),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              //Body
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                height: 140,
                                width: 140,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  backgroundImage: AssetImage(
                                      'assets/images/Profile/my_profile.png'),
                                ),
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Profile/profile_broder.png"),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 95,
                              left: 70,
                              child: FlatButton(
                                onPressed: () {},
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/Profile/edit.png',
                                        ),
                                        fit: BoxFit.cover),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Personal Information',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                        //1
                        Container(
                          padding: EdgeInsets.only(top: 14, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'First Name',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter First Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                    // isDense: true, // Added this
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //2
                        Container(
                          padding: EdgeInsets.only(top: 14, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Last Name',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter Last Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                    // isDense: true, // Added this
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //3
                        Container(
                          padding: EdgeInsets.only(top: 14, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Contact',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter Contact Number',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                    // isDense: true, // Added this
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //5
                        Container(
                          padding: EdgeInsets.only(top: 14, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Address',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter Address',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                    // isDense: true, // Added this
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //5
                        Container(
                          padding: EdgeInsets.only(top: 14, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'DOB',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'DD/MM/YYYY',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                    // isDense: true, // Added this
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //6
                        Container(
                          padding: EdgeInsets.only(top: 14, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  'Login Information',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: ScreenUtil().setSp(14),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter Email',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                    // isDense: true, // Added this
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //7
                        Container(
                          padding: EdgeInsets.only(
                            top: 14,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter Password',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                    // isDense: true, // Added this
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChangePassword(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Change Password',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),

      //Bottom Button
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              // color: Colors.yellow,
              width: MediaQuery.of(context).size.width * 1.0,
              child: RaisedButton(
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    'Update',
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
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
