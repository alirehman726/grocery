import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/product_model.dart';
import 'package:main_grocery/util/database_helper.dart';

class MenuWishList extends StatefulWidget {
  final ProductModel product;

  const MenuWishList({Key key, this.product}) : super(key: key);
  @override
  _MenuWishListState createState() => _MenuWishListState();
}

class _MenuWishListState extends State<MenuWishList> {
  List<ProductModel> _product = [];
  DatabaseHelper _dbHelper;
  int grid;
  bool isFavorite = false;
  bool isAddedCart = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
      // _dbHelper.fetchProduct();
    });
    _refreshProductsList();
  }

  _refreshProductsList() async {
    List<ProductModel> x = await _dbHelper.fetchProduct();
    setState(() {
      _product = x;
      print("Wish_List ==>${_product.length}");
    });
  }

  bool grid22 = false;
  double expandedHeight = ScreenUtil().setHeight(150.0);
  double fontSizeAppTitle = ScreenUtil().setSp(20.0);
  ScrollController _scrollController;

  Color barColor = Color(0xFFFAECD2).withOpacity(0.0);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Stack(
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
                SliverAppBar(
                  backgroundColor: Theme.of(context).accentColor,
                  automaticallyImplyLeading: false,
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
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 5, left: 20),
                            child: Image.asset('assets/images/AppBar/cart.png'),
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
                        fontSizeAppTitle = 40;
                      }
                      return Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 0.0, top: 10.0),
                            child: Transform.translate(
                              child: Text(
                                'Wish List',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
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
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              grid22 = !grid22;
                            });
                          },
                          child: Image.asset(
                            (!grid22)
                                ? 'assets/images/Product/grid3.png'
                                : 'assets/images/Product/grid2.png',
                            height: ScreenUtil().setHeight(20.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                      top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (grid22) ? 2 : 3,
                      mainAxisSpacing: (grid22) ? 20.0 : 14.0,
                      childAspectRatio: (grid22) ? 0.75 : 0.65,
                      crossAxisSpacing: (grid22) ? 20.0 : 14.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          width: ScreenUtil().setWidth(112),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4.0,
                                offset: Offset(0, 2.0),
                              )
                            ],
                            color: hexToColor(_product[index].bgColor),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(top: 6),
                                    // margin: EdgeInsets.only(
                                    //     top: (widget.grid == 2) ? 20.0 : 14.0),

                                    // child: Image.asset(
                                    //   _product[index].image[1],
                                    // ),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(10.0),
                                  ),
                                  Text(
                                    _product[index].name,
                                    style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil().setSp(12))
                                        .copyWith(
                                            // fontSize: ScreenUtil().setSp(
                                            //     (widget.grid == 2) ? 16.0 : 12.0),
                                            ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        // widget.products.sizes[0].qty,
                                        _product[index].sizes[0].qty,
                                        style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(10))
                                            .copyWith(
                                                // fontSize: ScreenUtil().setSp(
                                                //     (widget.grid == 2) ? 16.0 : 12.0),
                                                ),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(2.0),
                                      ),
                                      Text(
                                        // widget.products.sizes[0].sizeVal,
                                        _product[index].sizes[0].sizeVal,
                                        style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(10))
                                            .copyWith(
                                                // fontSize: ScreenUtil().setSp(
                                                //     (widget.grid == 2) ? 16.0 : 12.0),
                                                ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(5.0),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        // widget.products.prices[0].symbol,
                                        _product[index].prices[0].symbol,
                                        style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(20))
                                            .copyWith(
                                                // fontSize: ScreenUtil().setSp(
                                                //     (widget.grid == 2) ? 24.0 : 20.0),
                                                ),
                                      ),
                                      Text(
                                        // widget.products.prices[0].price,
                                        _product[index].prices[0].price,
                                        style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(20))
                                            .copyWith(
                                                // fontSize: ScreenUtil().setSp(
                                                //     (widget.grid == 2) ? 24.0 : 20.0),
                                                ),
                                      ),
                                    ],
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0.0,
                                right: 0.0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() async {
                                      await _dbHelper
                                          .deleteProduct(_product[index].id);
                                      _refreshProductsList();
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  child: Container(
                                    width: ScreenUtil().setWidth(30.0),
                                    height: ScreenUtil().setHeight(30.0),
                                    //     (widget.grid == 2) ? 40.0 : 30.0),
                                    // height: ScreenUtil().setHeight(
                                    //     (widget.grid == 2) ? 40.0 : 30.0),
                                    padding: EdgeInsets.all(4.0),
                                    child: Image.asset(
                                        "assets/images/card/ic_fav.png"),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (!isAddedCart) {
                                        isAddedCart = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: ScreenUtil().setWidth(30.0),
                                    // width:
                                    //     ScreenUtil().setWidth((widget.grid == 2) ? 40.0 : 30.0),
                                    // height: ScreenUtil()
                                    //     .setHeight((widget.grid == 2) ? 40.0 : 30.0),
                                    height: ScreenUtil().setHeight(30.0),
                                    padding: EdgeInsets.all(4.0),
                                    child: Image.asset((isAddedCart)
                                        ? "assets/images/card/ic_added_cart.png"
                                        : "assets/images/card/ic_add_cart.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: _product.length,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onSubmit(ProductModel products) async {
    var form = _formKey.currentState;
    form.save();

    print("Submit clicked ===> ${products.id.toString()}");

    if (products != null && products.id != null) {
      print("I am in if statement");
      int insertedId = await _dbHelper.insertProduct(products);
      print("Table Insert Id $insertedId");
    }
  }

  Color hexToColor(String code) {
    return Color(int.parse(code, radix: 16) + 0xFF000000);
  }
}
