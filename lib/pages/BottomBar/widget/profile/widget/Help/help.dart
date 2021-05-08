import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/pages/BottomBar/widget/profile/widget/Help/widget/raise_ticket.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  double expandedHeight = ScreenUtil().setHeight(150.0);
  double fontSizeAppTitle = ScreenUtil().setSp(20.0);
  ScrollController _scrollController;

  Color barColor = Color(0xFFFAECD2).withOpacity(0.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                              'Help & Support',
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
                  padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3)),
                              child: Card(
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/help/call.png',
                                        alignment: Alignment.center,
                                      ),
                                      Text(
                                        'Give us a call',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3)),
                              child: Card(
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RaiseTicket(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/help/rocket.png',
                                        alignment: Alignment.center,
                                      ),
                                      Text(
                                        'Raise Ticket here',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 470,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Card(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'FAQ',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(12)),
                                    ),
                                  ),
                                  Divider(
                                    height: 5,
                                  ),
                                  //1
                                  ListTile(
                                    title: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ExpansionTile(
                                          title: Text(
                                            'What is Grocery App?',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenUtil().setSp(12.0),
                                            ),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum is simply dummy text of the printing and typesetting industry. ',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize:
                                                      ScreenUtil().setSp(12),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //2
                                  ListTile(
                                    title: Column(
                                      children: <Widget>[
                                        ExpansionTile(
                                          title: Text(
                                            'What is Grocery App?',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenUtil().setSp(12.0),
                                            ),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum is simply dummy text of the printing and typesetting industry. ',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(12)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //3
                                  ListTile(
                                    title: Column(
                                      children: <Widget>[
                                        ExpansionTile(
                                          title: Text(
                                            'What is Grocery App?',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenUtil().setSp(12.0),
                                            ),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum is simply dummy text of the printing and typesetting industry. ',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(12)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //4
                                  ListTile(
                                    title: Column(
                                      children: <Widget>[
                                        ExpansionTile(
                                          title: Text(
                                            'What is Grocery App?',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenUtil().setSp(12.0),
                                            ),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum is simply dummy text of the printing and typesetting industry. ',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(12)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //5
                                  ListTile(
                                    title: Column(
                                      children: <Widget>[
                                        ExpansionTile(
                                          title: Text(
                                            'What is Grocery App?',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenUtil().setSp(12.0),
                                            ),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum is simply dummy text of the printing and typesetting industry. ',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(12)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //6
                                  ListTile(
                                    title: Column(
                                      children: <Widget>[
                                        ExpansionTile(
                                          title: Text(
                                            'What is Grocery App?',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenUtil().setSp(12.0),
                                            ),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum is simply dummy text of the printing and typesetting industry. ',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(12)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //7
                                  ListTile(
                                    title: Column(
                                      children: <Widget>[
                                        ExpansionTile(
                                          title: Text(
                                            'What is Grocery App?',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenUtil().setSp(12.0),
                                            ),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Ipsum is simply dummy text of the printing and typesetting industry. ',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        ScreenUtil().setSp(12)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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

// title: Row(
//   mainAxisAlignment:
//       MainAxisAlignment.spaceBetween,
//   children: <Widget>[
//     Container(
//       padding: EdgeInsets.only(bottom: 5),
//       child: Text(
//         'What is Grocery App?',
//         style: TextStyle(
//             color: Theme.of(context)
//                 .primaryColor,
//             fontWeight: FontWeight.bold,
//             fontSize:
//                 ScreenUtil().setSp(12)),
//       ),
//     ),
//     Icon(
//       Icons.keyboard_arrow_down,
//       color: Theme.of(context).primaryColor,
//     )
//   ],
// ),
