import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 

class DiscountCheckbox extends StatefulWidget {
  final String title;

  DiscountCheckbox({Key key, this.title}) : super(key: key);

  @override
  _DiscountCheckboxState createState() => _DiscountCheckboxState();
}

class _DiscountCheckboxState extends State<DiscountCheckbox> {
  bool isChecked = false;

  _onReset() {
    setState(() {
      isChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Selected");
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 4.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: isChecked
                  ? Icon(
                      Icons.check_box,
                      color: Theme.of(context).backgroundColor,
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Theme.of(context).backgroundColor,
                    ),
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
            ),
            SizedBox(
              width: 15.0,
            ),
            InkWell(
              child: Text(widget.title,
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.normal,
                      fontSize: ScreenUtil().setSp(12))),
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
