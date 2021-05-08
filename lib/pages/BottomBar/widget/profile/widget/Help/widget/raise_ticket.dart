import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/Help/help.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/Help/widget/raise_ticket_history.dart';

class RaiseTicket extends StatefulWidget {
  @override
  _RaiseTicketState createState() => _RaiseTicketState();
}

class _RaiseTicketState extends State<RaiseTicket> {
  var bottomComponentHeight = ScreenUtil().setHeight(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).accentColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Image.asset('assets/images/back.png'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Help(),
                      ),
                    );
                  }),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 5, left: 20),
                child: Image.asset('assets/images/help/raise.png'),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/ig_background.png'),
              width: ScreenUtil().setWidth(412),
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Raise Ticket',
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(30),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 14,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Name',
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
                            BoxShadow(blurRadius: 4.0, color: Colors.black12)
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
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
                  padding: EdgeInsets.only(
                    top: 14,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                            BoxShadow(blurRadius: 4.0, color: Colors.black12)
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
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
                  padding: EdgeInsets.only(
                    top: 14,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Issue',
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
                            BoxShadow(blurRadius: 4.0, color: Colors.black12)
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Issue',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
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
                // Container(
                //   padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Text(
                //         'Description',
                //         style: TextStyle(
                //           color: Theme.of(context).primaryColor,
                //           fontSize: ScreenUtil().setSp(14),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 5,
                //       ),
                //       Material(
                //         elevation: 4,
                //         child: Container(
                //           height: 100,
                //           // decoration: BoxDecoration(
                //           //   color: Colors.white,
                //           // ),
                //           child: TextField(
                //             obscureText: true,
                //             decoration: InputDecoration(
                //               hintText: 'Description',
                //               hintStyle: TextStyle(
                //                   fontSize: ScreenUtil().setSp(14)),
                //               border: OutlineInputBorder(),
                //               contentPadding: EdgeInsets.all(10),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          '+ Add Attachment',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: bottomComponentHeight,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width * 1.0,
                      child: RaisedButton(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            'RAISE TICKET',
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
                              builder: (context) => RaiseTicketHistory(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
