import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:main_grocery/models/product_model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'greatdealcard_widget.dart';

class GreatDealListView extends StatefulWidget {
  List<ProductModel> deals = ProductModel.fetchDeals();
  @override
  _GreatDealListViewState createState() => _GreatDealListViewState();
}

class _GreatDealListViewState extends State<GreatDealListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(180.0),
        child: ScrollablePositionedList.builder(
          itemCount: widget.deals.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GreatDealCard(
            product: widget.deals[index],
          ),
        ));
  }
}
