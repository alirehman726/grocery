import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/pages/BottomBar/widget/profile/profile_menu.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/Address/delivery_Address.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
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

  var middleComponentHeight = ScreenUtil().setHeight(180);
  var bottomComponentHeight = ScreenUtil().setHeight(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.9),
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
                        builder: (context) => DeliveryAddress(),
                      ),
                    );
                  }),
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
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(30),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Text(
                    'Address',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(50),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'New Address Information',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.bold),
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
                                hintText: 'Address',
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
                            'Name of Person',
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
                    //3
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
                            'Contact No',
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
                                hintText: 'Contact',
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
                    //4
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 12, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Address Type',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  value: 'one',
                                  activeColor: Theme.of(context).primaryColor,
                                  groupValue: _radioValue,
                                  onChanged: radioButtonChanges,
                                ),
                                Text("Home"),
                                //2
                                Radio(
                                  value: 'Two',
                                  activeColor: Theme.of(context).primaryColor,
                                  groupValue: _radioValue,
                                  onChanged: radioButtonChanges,
                                ),
                                Text("Office"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                            'ADD ADDRESS',
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
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileMenu(),
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
