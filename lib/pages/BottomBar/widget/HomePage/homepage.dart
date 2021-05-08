import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:main_grocery/models/address_modal.dart';
import 'package:main_grocery/models/product_model.dart';
import 'package:main_grocery/pages/BottomBar/widget/Category/widget/View_page.dart';
import 'package:main_grocery/pages/BottomBar/widget/Category/widget/vegetable_page.dart';
import 'package:main_grocery/pages/BottomBar/widget/HomePage/widget/banner.dart';
import 'package:main_grocery/pages/BottomBar/widget/HomePage/widget/categorydeallistview_widget.dart';
import 'package:main_grocery/pages/BottomBar/widget/HomePage/widget/categorylist.dart';
import 'package:main_grocery/pages/BottomBar/widget/HomePage/widget/great_deal.dart';
import 'package:main_grocery/pages/BottomBar/widget/HomePage/widget/location.dart';
import 'package:main_grocery/pages/BottomBar/widget/HomePage/widget/viewallcard.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;

  @override
  void initState() {
    super.initState();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _streamSubscription = Geolocator()
        .getPositionStream(locationOptions)
        .listen((Position position) {
      setState(() {
        // print(position);
        _position = position;

        final coordinates =
            new Coordinates(position.latitude, position.longitude);
        convertCoordinatesToAddress(coordinates)
            .then((value) => _address = value);
      });
    });
  }

  bool isGrid22 = false;
  List<ProductModel> product = ProductModel.fetchAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/Login/background.png'),
            height: ScreenUtil().setHeight(850),
            width: ScreenUtil().setWidth(412),
            fit: BoxFit.fill,
          ),
          CustomScrollView(
            slivers: <Widget>[
              //-------------SliverAppBar------------//

              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Theme.of(context).accentColor,
                pinned: true,
                primary: true,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/location.png',
                            height: ScreenUtil().setHeight(24.0),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(5.0),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Location(),
                                  ),
                                );
                              },
                              child: Text(
                                "${_address?.addressLine ?? '-'}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                softWrap: false,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(12.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
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
                                backgroundColor: Theme.of(context).primaryColor,
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
                              child:
                                  Image.asset('assets/images/AppBar/cart.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    buildSliverListItems(),
                  ),
                ),
              ),

              //=======GridView=====//

              SliverPadding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (isGrid22) ? 2 : 3,
                    mainAxisSpacing: (isGrid22) ? 20.0 : 14.0,
                    crossAxisSpacing: (isGrid22) ? 20.0 : 14.0,
                    childAspectRatio: (isGrid22) ? .75 : .65,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index != product.length) {
                        return ProductCard(
                          products: product[index],
                          grid: (isGrid22) ? 2 : 3,
                        );
                      } else {
                        return ViewAllCard();
                      }
                    },
                    childCount: product.length + 1,
                  ),
                ),
              ),

              //======= Great Deal Item======//

              SliverPadding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    buildSliverGreatDealListItems(),
                  ),
                ),
              ),

              //========= Great Category Deal Item========//

              SliverPadding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    buildSliverCategoryDealListItems(),
                  ),
                ),
              ),

              //=======Best Seller======//

              SliverPadding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    buildSliverBestSeller(),
                  ),
                ),
              ),

              //====Footer======//
              SliverList(
                delegate: SliverChildListDelegate(
                  buildSliverStoreItem(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: missing_return
  List<Widget> buildSliverListItems() {
    List<Widget> items = List();

    //---------SEARCH BAR----------//

    items.add(
      _searchBar(),
    );

    items.add(
      SizedBox(
        height: ScreenUtil().setHeight(15.0),
      ),
    );

    //=============BANNER==========//

    items.add(
      BannerView(),
    );

    //============Category-List=======//

    items.add(
      CategoryList(),
    );

    //============Popular Item ListView===========//

    items.add(
      PopularListTileView(),
    );

    return items;
  }

  Widget _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5.0),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(3.0),
              ),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
            hintText: "Search Bar",
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5),
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
          cursorColor: Theme.of(context).primaryColor,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.normal,
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
      ),
    );
  }

  Widget PopularListTileView() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Popular Items',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Clicked');
                  setState(() {
                    isGrid22 = !isGrid22;
                  });
                },
                child: Image.asset(
                  (!isGrid22)
                      ? 'assets/images/Product/grid3.png'
                      : 'assets/images/Product/grid2.png',
                  height: ScreenUtil().setHeight(20.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //Great Deals title
  List<Widget> buildSliverGreatDealListItems() {
    List<Widget> items = List();

    items.add(
      GreatDealListTitleView(),
    );

    items.add(
      GreatDealListView(),
    );

    return items;
  }

  //Great Deals Item

  List<Widget> buildSliverCategoryDealListItems() {
    List<Widget> items = List();

    // Category Deal Item Title View
    items.add(
      CategoryDealListTitleView(),
    );

    items.add(
      CategoryDealListView(),
    );
    return items;
  }

  //Best-seller
  List<Widget> buildSliverBestSeller() {
    List<Widget> items = List();

    items.add(
      BestSellerListTitleView(),
    );

    items.add(
      GreatDealListView(),
    );

    items.add(
      SizedBox(
        height: ScreenUtil().setHeight(20.0),
      ),
    );
    return items;
  }

  //Footer
  List<Widget> buildSliverStoreItem() {
    List<Widget> items = List();

    // Footer Item
    items.add(
      StoreInformationView(),
    );

    return items;
  }

  Widget CategoryDealListTitleView() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: Text(
        "Deals On Category",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(16.0),
        ),
      ),
    );
  }

  //Great Deals
  Widget GreatDealListTitleView() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Great Deals',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(16.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Clicked');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewPage(),
                    ),
                  );
                },
                child: Text(
                  'View all'.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(10),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //Best-Seller
  Widget BestSellerListTitleView() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Best Seller',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(16.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Clicked');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewPage(),
                    ),
                  );
                },
                child: Text(
                  'View all'.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(10),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //Footer
  Widget StoreInformationView() {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Theme.of(context).primaryColor.withOpacity(0.85),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Grocery Store",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(8.0),
          ),
          Text(
            "C232, Siddhi Vinayak Towers, Near Kataria Arcade, Opp. S.G. Highway, Makarba, Ahmedabad, Gujarat, India - 380051",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14.0),
              fontWeight: FontWeight.normal,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15.0),
          ),
          Divider(
            height: 2.0,
            color: Colors.white.withOpacity(0.8),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Store Contact",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(20.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "+91 9033870071",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(16.0),
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "+91 9033878701",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(16.0),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Socials",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(20.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          print("Facebook Clicked");
                        },
                        child: Image(
                          image:
                              AssetImage("assets/images/social/whatsapp.png"),
                          width: ScreenUtil().setWidth(26.0),
                          height: ScreenUtil().setHeight(26.0),
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(16.0),
                      ),
                      InkWell(
                        onTap: () {
                          print("Instagram Clicked");
                        },
                        child: Image(
                          image:
                              AssetImage("assets/images/social/facebook.png"),
                          width: ScreenUtil().setWidth(26.0),
                          height: ScreenUtil().setHeight(26.0),
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(16.0),
                      ),
                      InkWell(
                        onTap: () {
                          print("Twitter Clicked");
                        },
                        child: Image(
                          image:
                              AssetImage("assets/images/social/instagram.png"),
                          width: ScreenUtil().setWidth(26.0),
                          height: ScreenUtil().setHeight(26.0),
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }
}
