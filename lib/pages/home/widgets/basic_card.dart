import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ummie/config/config.dart';

class BasicCard extends StatelessWidget {
  final String type;
  final String image;
  BoxDecoration boxDecoration = defaultDecoration;

  BasicCard({
    Key? key,
    required this.type,
    required this.image,
    BoxDecoration? boxDecoration}) : super(key: key);

  BasicCard status(bool isSelected) {
    boxDecoration = isSelected ? selectedDecoration : defaultDecoration;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h,
      width: 186.w,
      decoration: boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.h, left: 14.w),
            child: Text(type, style: TextStyle(fontSize: 22.sp),),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 26.h, right: 18.w),
            child: Image.asset(image, height: 60.h, width: 60.w, alignment: Alignment.topRight,),
          ),
        ],
      ),
    );
  }
}