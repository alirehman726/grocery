import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/category.dart';
import 'package:main_grocery/models/product_model.dart';
import 'package:main_grocery/routes/route_names.dart';

import 'Filter/brandchip_widget.dart';
import 'Filter/discountcheckbox_widget.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List<ProductModel> product = ProductModel.fetchAll();
  bool grid22 = false;
  double expandedHeight = ScreenUtil().setHeight(150.0);
  double fontSizeAppTitle = ScreenUtil().setSp(20.0);
  ScrollController _scrollController;

  Color barColor = Color(0xFFFAECD2).withOpacity(0.0);

  RangeValues values = RangeValues(1, 100);
  RangeLabels labels = RangeLabels('1', '100');
  List<String> sortList = [
    "Newest arrival",
    "Best Sellers",
    "Low to High",
    "High to Low"
  ];
  String _selectedSort;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    CategoryModel category = ModalRoute.of(context).settings.arguments;
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
          CustomScrollView(
            controller: _scrollController,
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
                actions: <Widget>[
                  IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/filter.png'),
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      print('Open Filter');
                      _showFilter();
                    },
                  ),
                ],
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percent = ((constraints.maxHeight - kToolbarHeight) *
                        100 /
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
                              'Product',
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
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        // product.length.toString() + ' Products',

                        product.length.toString() + " Products",

                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(16.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: _selectedSort,
                              onChanged: (newVal) {
                                setState(() {
                                  _selectedSort = newVal;
                                });
                              },
                              // dropdownColor: Colors.white,
                              elevation: 1,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Theme.of(context).primaryColor,
                              ),
                              items: sortList.map((sort) {
                                return DropdownMenuItem(
                                  value: sort,
                                  child: Text(
                                    sort,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(12.0),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
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
                      return ProductCard1(
                        product: product[index],
                        grid: (grid22) ? 2 : 3,
                      );
                    },
                    childCount: product.length,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _showFilter() {
    Future<void> future = showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: ScreenUtil().setHeight(700.0),
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                        'Filter'.toUpperCase(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(16)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Brand'.toUpperCase(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "See More".toUpperCase(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(15)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  wrapWidget(),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Discount".toUpperCase(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                    ],
                  ),
                  discountWidget(),
                  RangeSlider(
                    min: 1,
                    max: 100,
                    inactiveColor: Theme.of(context).backgroundColor,
                    activeColor: Theme.of(context).primaryColor,
                    values: values,
                    // labels: labels,
                    onChanged: (value) {
                      print('Start: ${value.start}, End: ${value.end}');
                      setState(() {
                        values = value;
                        // labels = RangeLabels(value.start.toInt().toString(),
                        //     value.end.toInt().toString());
                      });
                    },
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: FlatButton(
                          padding: EdgeInsets.only(
                            top: 17.0,
                            bottom: 17.0,
                          ),
                          onPressed: () {
                            print("Reset Clicked");
                          },
                          child: Text(
                            "Reset".toUpperCase(),
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(16)),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.of(context).backgroundColor,
                                  width: 2,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(3.0)),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 5,
                        child: FlatButton(
                          padding: EdgeInsets.only(
                            top: 17.0,
                            bottom: 17.0,
                          ),
                          onPressed: () {
                            print("Apply Clicked");
                          },
                          child: Text(
                            "Apply".toUpperCase(),
                            style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(16))
                                .copyWith(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(3.0)),
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget wrapWidget() {
    return Wrap(
      children: <Widget>[
        BrandChip(label: "Abbies"),
        BrandChip(label: "Agnesi"),
        BrandChip(label: "BB Combo"),
        BrandChip(label: "Barilla"),
        BrandChip(label: "Brown & Polson"),
        BrandChip(label: "Dabur"),
        BrandChip(label: "Epicture"),
      ],
    );
  }

  Widget discountWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(10.0),
        ),
        DiscountCheckbox(title: "Upto 5%"),
        DiscountCheckbox(title: "5% - 10%"),
        DiscountCheckbox(title: "10% - 20%"),
        DiscountCheckbox(title: "20% - 30%"),
        DiscountCheckbox(title: "More than 30%"),
      ],
    );
  }
}

class ProductCard1 extends StatefulWidget {
  final ProductModel product;
  final int grid;

  ProductCard1({Key key, this.product, this.grid}) : super(key: key);
  @override
  _ProductCard1State createState() => _ProductCard1State();
}

class _ProductCard1State extends State<ProductCard1> {
  bool isFavorite = false;
  bool isAddedCart = false;
  int grid = 3;

  @override
  void initState() {
    super.initState();
    grid = widget.grid;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Card Click ==> ' + widget.product.name);

        Navigator.of(context)
            .pushNamed(productDetail, arguments: widget.product);

        // Navigator.of(context)
        // .pushNamed(productDetail, arguments: widget.product);
      },
      child: Container(
        width: ScreenUtil().setWidth(112),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 4.0, offset: Offset(0, 2.0))
          ],
          color: hexToColor(widget.product.bgColor),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 6),
                  margin:
                      EdgeInsets.only(top: (widget.grid == 2) ? 20.0 : 14.0),
                  // child: CachedNetworkImage(
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   imageUrl: widget.product.image[0],
                  //   fit: BoxFit.scaleDown,
                  //   height: ScreenUtil()
                  //       .setHeight((widget.grid == 2) ? 80.0 : 60.0),
                  // ),
                  child: Image.asset(widget.product.image[0]),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10.0),
                ),
                Text(
                  widget.product.name,
                  style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(12))
                      .copyWith(
                    fontSize:
                        ScreenUtil().setSp((widget.grid == 2) ? 16.0 : 12.0),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.product.sizes[0].qty,
                      style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(10))
                          .copyWith(
                        fontSize: ScreenUtil()
                            .setSp((widget.grid == 2) ? 16.0 : 12.0),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(2.0),
                    ),
                    Text(
                      widget.product.sizes[0].sizeVal,
                      style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(10))
                          .copyWith(
                        fontSize: ScreenUtil()
                            .setSp((widget.grid == 2) ? 16.0 : 12.0),
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
                      widget.product.prices[0].symbol,
                      style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(20))
                          .copyWith(
                              fontSize: ScreenUtil()
                                  .setSp((widget.grid == 2) ? 24.0 : 20.0)),
                    ),
                    Text(
                      widget.product.prices[0].price,
                      style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(20))
                          .copyWith(
                              fontSize: ScreenUtil()
                                  .setSp((widget.grid == 2) ? 24.0 : 20.0)),
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
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  width:
                      ScreenUtil().setWidth((widget.grid == 2) ? 40.0 : 30.0),
                  height:
                      ScreenUtil().setHeight((widget.grid == 2) ? 40.0 : 30.0),
                  padding: EdgeInsets.all(4.0),
                  child: Image.asset(
                    (isFavorite)
                        ? "assets/images/card/ic_fav.png"
                        : "assets/images/card/ic_unfav.png",
                  ),
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
                  width:
                      ScreenUtil().setWidth((widget.grid == 2) ? 40.0 : 30.0),
                  height:
                      ScreenUtil().setHeight((widget.grid == 2) ? 40.0 : 30.0),
                  padding: EdgeInsets.all(4.0),
                  child: Image.asset((isAddedCart)
                      ? "assets/images/card/ic_added_cart.png"
                      : "assets/images/card/ic_add_cart.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    return Color(int.parse(code, radix: 16) + 0xFF000000);
  }
}
