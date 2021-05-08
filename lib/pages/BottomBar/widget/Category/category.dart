import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/category.dart';
import 'package:main_grocery/routes/route_names.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategoryModel> items = CategoryModel.fetchAll();

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
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Theme.of(context).accentColor,
                pinned: true,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Text(
                        'All Categories',
                        style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(25),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
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
                    )
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20.0),
                  right: ScreenUtil().setWidth(20.0),
                ),
                sliver: SliverToBoxAdapter(
                  child: _searchBar(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(20),
                  top: ScreenUtil().setWidth(20),
                ),
                sliver: _categoryGridView(),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            border: OutlineInputBorder(),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            fillColor: Colors.white,
            hintText: 'Search Bar',
            hintStyle: TextStyle(
              color: Color(0XFFDEDEDE),
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14),
            ),
            filled: true,
          ),
          cursorColor: Theme.of(context).primaryColor,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setSp(12)),
        ),
      ),
    );
  }

  Widget _categoryGridView() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 0.99),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return CategoryCard(
          category: items[index],
        );
      }, childCount: items.length),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryModel category;
  Function press;
  CategoryCard({Key key, this.category, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, categoryProduct, arguments: category);
      },
      child: Container(
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(10.0)),
        width: ScreenUtil().setWidth(85.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(85.0),
              width: ScreenUtil().setWidth(85.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ]),
              alignment: Alignment.center,
              child: Image.asset(
                category.image,
                width: ScreenUtil().setWidth(45.0),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(2.0),
            ),
            Text(
              category.name,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(10)),
            )
          ],
        ),
      ),
    );
  }
}
