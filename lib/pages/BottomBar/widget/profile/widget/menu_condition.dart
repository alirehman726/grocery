import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuCondition extends StatefulWidget {
  @override
  _MenuConditionState createState() => _MenuConditionState();
}

class _MenuConditionState extends State<MenuCondition> {
  double expandedHeight = ScreenUtil().setHeight(150.0);
  double fontSizeAppTitle = ScreenUtil().setSp(20.0);
  ScrollController _scrollController;

  Color barColor = Color(0xFFFAECD2).withOpacity(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      fontSizeAppTitle = 18;
                    } else if (fontSizeAppTitle > 31) {
                      fontSizeAppTitle = 25;
                    }
                    return Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 0.0, top: 12.0),
                          child: Transform.translate(
                            child: Text(
                              'Terms & Conditions',
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
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          // height: 610,
                          width: MediaQuery.of(context).size.width * 1.0,
                          child: Card(
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: ScreenUtil().setSp(12)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
