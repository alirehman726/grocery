import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandChip extends StatefulWidget {
  final String label;

  BrandChip({Key key, this.label}) : super(key: key);

  @override
  _BrandChipState createState() => _BrandChipState();
}

class _BrandChipState extends State<BrandChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 5.0,
      ),
      child: FilterChip(
        labelPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
        label: Text(
          widget.label,
          style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: ScreenUtil().setSp(12))
              .copyWith(
                  color: (isSelected)
                      ? Colors.white
                      : Theme.of(context).backgroundColor),
        ),
        shape: StadiumBorder(
            side: BorderSide(
                color: (isSelected)
                    ? Colors.white
                    : Theme.of(context).backgroundColor,
                width: 1,
                style: BorderStyle.solid)),
        elevation: 0.0,
        backgroundColor:
            (isSelected) ? Theme.of(context).backgroundColor : Colors.white,
        onSelected: (bool value) {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
    );
  }
}
