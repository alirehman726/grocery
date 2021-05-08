import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageList extends StatefulWidget {
  List<String> image = List();
  int _index = 0;

  ImageList({Key key, this.image}) : super(key: key);
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                print("Current Image visible index is ${index}");
                setState(() {
                  widget._index = index;
                });
              },
            ),
            items: widget.image.map((image) {
              return Builder(
                builder: (context) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                    // child: CachedNetworkImage(
                    //   imageUrl: image,
                    //   fit: BoxFit.cover,
                    // ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(5.0),
            ),
            width: ScreenUtil().setWidth(110.0),
            height: ScreenUtil().setHeight(20.0),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // doGetBullets(widget.image.length),
              ],
            ),
          ),
        )
      ],
    );
  }

  // doGetBullets(int length) {
  //   List<Widget> items = List();

  //   for (int i = 0; i < length; i++) {
  //     items.add(
  //       Container(
  //         width: ScreenUtil().setWidth(8.0),
  //         height: ScreenUtil().setWidth(8.0),
  //         decoration: BoxDecoration(
  //             color: (widget._index == i)
  //                 ? Theme.of(context).primaryColor
  //                 : Theme.of(context).primaryColor.withOpacity(0.5),
  //             shape: BoxShape.circle),
  //       ),
  //     );
  //   }
  //   return items;
  // }
}
