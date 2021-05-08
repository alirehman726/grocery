import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/models/country.dart';
import 'package:main_grocery/pages/BottomBar/bottomnavigation.dart';
import 'package:main_grocery/pages/Login_Page/widget/otp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<Country> _companies = Country.getCompanies();
  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Country>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Country>> items = List();
    for (Country company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Country selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 412, height: 870);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
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
                      padding: EdgeInsets.only(left: 20, top: 76),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(30),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Grocery App',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(50)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.2,
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color(0xFFDEDEDE),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    value: _selectedCompany,
                                    items: _dropdownMenuItems,
                                    onChanged: onChangeDropdownItem,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0, color: Colors.black12)
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter Mobile Number',
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
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 5, bottom: 80),
                            child: Text(
                              'You will get 4 digit verification code via SMS',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      width: MediaQuery.of(context).size.width * 1.0,
                      child: RaisedButton(
                        child: Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 12),
                          child: Text(
                            'NEXT',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Otp(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 00),
                      width: MediaQuery.of(context).size.width * 1.0,
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        // color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavigation(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
