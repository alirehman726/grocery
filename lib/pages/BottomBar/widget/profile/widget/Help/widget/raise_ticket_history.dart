import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/Help/widget/raise_ticket.dart';

class RaiseTicketHistory extends StatefulWidget {
  @override
  _RaiseTicketHistoryState createState() => _RaiseTicketHistoryState();
}

class _RaiseTicketHistoryState extends State<RaiseTicketHistory> {
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
          title: IconButton(
              icon: Image.asset('assets/images/back.png'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RaiseTicket(),
                  ),
                );
              }),
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
                    'Raise Ticket History',
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(30),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  height: ScreenUtil().setHeight(650),
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: _listView(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ListView _listView(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Image upload is not working',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.normal,
                              fontSize: ScreenUtil().setSp(12)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          '24th August 2020, 03:30 PM',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(10)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text(
                      'PADDING',
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
