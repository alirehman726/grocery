import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_grocery/models/category.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'categorydealcard_widget.dart';

class CategoryDealListView extends StatelessWidget {
  List<CategoryModel> deals = CategoryModel.fetchAllDeals();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(120.0),
      child: ScrollablePositionedList.builder(
        itemCount: deals.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryDealCard(
          category: deals[index],
        ),
      ),
    );
  }
}
