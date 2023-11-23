
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/colors/colors.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({this.text,
    Key? key}) :super(key: key);
  String? text;
  @override
  Widget build(BuildContext context) {
    return Text(text!,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: black,
        fontSize: ScreenUtil().setSp(35),
        fontWeight: FontWeight.bold
      ),
    );
  }
}
