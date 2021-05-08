// import 'package:flutter/material.dart';
// import 'package:grocery2/pages/Installation_Page/widget/installing_page1.dart';
// import 'package:grocery2/pages/Installation_Page/widget/installing_page2.dart';
// import 'package:grocery2/pages/Installation_Page/widget/installing_page3.dart';

// class PageViewDemo extends StatefulWidget {
//   @override
//   _PageViewDemoState createState() => _PageViewDemoState();
// }

// class _PageViewDemoState extends State<PageViewDemo> {
//   PageController _controller = PageController(
//     initialPage: 0,
//   );

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: _controller,
//       children: [
//         InstallingPage1(),
//         InstallingPage2(),
//         InstallingPage3(),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/routes/route_names.dart';

import 'intro_widget.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;

  int currentPageValue = 0;
  int prevPageValue = 0;
  PageController controller;

  double _moveBar = 0.0;

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: currentPageValue);
  }

  doOpenHomePage() {
    Navigator.pushReplacementNamed(context, dashboardRoute);
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;

    if (prevPageValue == 0) {
      prevPageValue = page;
      _moveBar = _moveBar + 0.045;
    } else {
      if (prevPageValue < page) {
        prevPageValue = page;
        _moveBar = _moveBar + 0.045;
      } else {
        prevPageValue = page;
        _moveBar = _moveBar - 0.045;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    final List<Widget> introWidgets = <Widget>[
      IntroWidget(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          index: 0,
          image: 'assets/images/installation/installation_1.png',
          type: 'freshfood',
          title: 'Fresh Food',
          subtitle:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
      IntroWidget(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          index: 1,
          image: 'assets/images/installation/installation_2.png',
          type: 'fastdelivery',
          title: 'Fast Delivery',
          subtitle:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
      IntroWidget(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          index: 2,
          image: 'assets/images/installation/installation_3.png',
          type: 'easypayment',
          title: 'Easy Payment',
          subtitle:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.')
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[doGetSkipButton()],
              ),
              flex: 1,
            ),
            Expanded(
              child: PageView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: introWidgets.length,
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                },
                controller: controller,
                itemBuilder: (context, index) {
                  return introWidgets[index];
                },
              ),
              flex: 8,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  top: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.fastOutSlowIn,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          for (var i = 0; i < introWidgets.length; i++)
                            movingBar(i)
                        ],
                      ),
                    ),
                    doGetNextButton()
                  ],
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget doGetSkipButton() {
    if (currentPageValue != 2) {
      return FlatButton(
        color: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          "Skip",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(12.0),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).backgroundColor),
        ),
        onPressed: () {
          print("Skip clicked!");
          doOpenHomePage();
        },
      );
    } else {
      return FlatButton(
        onPressed: () {},
        child: null,
      );
    }
  }

  Widget doGetNextButton() {
    if (currentPageValue != 2) {
      return FlatButton(
        color: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          children: <Widget>[
            Text(
              "Next".toUpperCase(),
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14.0),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset("assets/images/installation/installation_next.png")
          ],
        ),
        onPressed: () {
          setState(() {
            controller.animateToPage(currentPageValue + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn);
          });
        },
      );
    } else {
      return FlatButton(
        onPressed: () {},
        child: null,
      );
    }
  }

  Container movingBar(index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          color: (index == currentPageValue)
              ? Theme.of(context).primaryColor
              : Colors.black38,
          shape: BoxShape.circle),
    );
  }

  Widget slidingBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 5,
      width: 5,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
    );
  }
}
