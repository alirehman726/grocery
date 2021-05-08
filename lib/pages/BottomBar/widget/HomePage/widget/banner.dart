  
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/models/banner_model.dart';

class BannerView extends StatefulWidget {
  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  List<BannerModel> bannerImages = BannerModel.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: ScreenUtil().setHeight(130.0),
          reverse: false,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOut,
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          initialPage: 0,
          scrollDirection: Axis.horizontal,
          viewportFraction: 1.0,
          enlargeCenterPage: true,
        ),
        items: bannerImages.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(
                    item.bannerImageLink,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
