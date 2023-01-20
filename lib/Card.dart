import 'package:flutter/material.dart';
import 'package:ummie/CONSTANT.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypeCard extends StatelessWidget {
  final bool isSelect;
  final Function()? onTap;
  final BasicCard basicCard;

  const TypeCard({
    Key? key,
    required this.basicCard,
    required this.isSelect,
    this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: basicCard.status(isSelect),
    );
  }
}

class BasicCard extends StatelessWidget {
  final String type;
  final String image;
  BoxDecoration boxDecoration = DEFAULTDECORATION;

  BasicCard({
    Key? key,
    required this.type,
    required this.image,
    BoxDecoration? boxDecoration}) : super(key: key);

  BasicCard status(bool isSelected) {
    boxDecoration = isSelected ? SELECTEDDECORATION : DEFAULTDECORATION;
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
            child: Text("${type}", style: TextStyle(fontSize: 22.sp),),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 26.h, right: 18.w),
            child: Image.asset("${image}", height: 60.h, width: 60.w, alignment: Alignment.topRight,),
          ),
        ],
      ),
    );
  }
}

typedef ListItemCallback = Function(FilterCards filterCard);

class FilterCards extends StatelessWidget {
  final Map<String, bool> filterRules;
  final int selectedFilterRule;
  final Function()? onTap;

  const FilterCards({
    Key? key,
    required this.filterRules,
    required this.selectedFilterRule,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filterRules.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            print(filterRules.keys);
          },
          child: Container(
            margin: EdgeInsets.only(left: 21.w, right: 21.w, bottom: 14.h),
            height: 52.h,
            width: double.infinity,
            decoration: index == selectedFilterRule? SELECTEDDECORATION : DEFAULTDECORATION,
            child: Container(
              margin: EdgeInsets.only(left: 22.w),
              alignment: Alignment.centerLeft,
              child: Text('${filterRules[index]}', style: TextStyle(fontSize: 20.sp),),
            ),
          ),
        );
      },
    );
  }
}

