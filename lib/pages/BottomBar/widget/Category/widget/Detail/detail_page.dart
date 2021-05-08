import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'; 
import 'package:main_grocery/models/product_model.dart'; 
import 'package:main_grocery/pages/BottomBar/widget/Category/widget/vegetable_page.dart';

import 'imagelist.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isAddedToCart = false;
  bool isMarkedAsFav = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height -
                    ScreenUtil().setHeight(130),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      backgroundColor: Theme.of(context).accentColor,
                      pinned: true,
                      floating: true,
                      snap: false,
                      leading: IconButton(
                          icon: ImageIcon(
                            AssetImage(
                              'assets/images/back.png',
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      expandedHeight: ScreenUtil().setHeight(200.0),
                      actions: <Widget>[
                        InkWell(
                          onTap: () {
                            print('Click To Cart');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: ScreenUtil().setHeight(45.0),
                            width: ScreenUtil().setWidth(45.0),
                            margin: EdgeInsets.only(
                              right: ScreenUtil().setWidth(15.0),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/AppBar/cart.png',
                                  height: ScreenUtil().setHeight(40.0),
                                  width: ScreenUtil().setWidth(30.0),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: ImageList(
                          image: product.image,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3.0,
                                offset: Offset(0, 0),
                              )
                            ]),
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
                                  product.name,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(16.0),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print('Favorited Clicked');
                                    setState(() {
                                      isMarkedAsFav = !isMarkedAsFav;
                                    });
                                  },
                                  child: Image.asset(
                                    (isMarkedAsFav)
                                        ? "assets/images/card/ic_fav.png"
                                        : "assets/images/card/ic_unfav.png",
                                    width: 24.0,
                                    height: 24.0,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              product.sizes[0].qty +
                                  " " +
                                  product.sizes[0].sizeVal,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.normal,
                                fontSize: ScreenUtil().setSp(12.0),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5.0),
                            ),
                            Text(
                              'Fruits',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(12),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10.0),
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14.0),
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5.0),
                            ),
                            HtmlWidget(
                              product.description,
                              textStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(10.0),
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(15.0),
                            ),
                            Text(
                              "Related Items",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(16.0),
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Container(
                              height: ScreenUtil().setHeight(220.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      right: 10.0,
                                      top: 5.0,
                                      bottom: 5.0,
                                    ),
                                    child: ProductCard(
                                      products: product,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.grey[50],
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil().setHeight(130),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Price',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(12.0),
                          ),
                        ),
                        Text(
                          product.prices[0].symbol +
                              " " +
                              product.prices[0].price,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(30.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        !isAddedToCart
                            ? FlatButton(
                                padding: EdgeInsets.only(
                                    top: 15,
                                    bottom: 15,
                                    right: 45.0,
                                    left: 45.0),
                                onPressed: () {
                                  print('Apply Clicked');
                                  setState(() {
                                    isAddedToCart = !isAddedToCart;
                                  });
                                },
                                child: Text(
                                  'Add To cart'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(16.0),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Theme.of(context).primaryColor,
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    padding: EdgeInsets.only(
                                        top: 15.0,
                                        bottom: 15.0,
                                        left: 45.0,
                                        right: 45.0),
                                    onPressed: () {},
                                    child: Text(
                                      'Addedd'.toUpperCase(),
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(16.0),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    color: Colors.white,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(5.0),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isAddedToCart = !isAddedToCart;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                          color:
                                              Theme.of(context).backgroundColor,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
