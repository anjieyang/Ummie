import 'package:flutter/material.dart';
import 'package:ummie/AddFriendPage.dart';
import 'package:ummie/CONSTANT.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ummie/CreateRoomPage.dart';
import 'package:ummie/HexColor.dart';
import 'package:ummie/Ummicons_icons.dart';

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

class HomePagePopMenu extends StatelessWidget {
  const HomePagePopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 21.w),
      child: Theme(
        data: Theme.of(context).copyWith(
          cardColor: HexColor("2B2B2B"),
        ),
        child: PopupMenuButton(
          offset: Offset(10.w, 56.h),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: const Icon(Icons.add_circle_outline, color: Colors.black, size: 28,),
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                value: 1,
                child: Container(
                  width: 120.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Icon(Ummicons.create_room, color: Colors.white, size: 20.sp,),
                      ),
                      Text("创建房间", style: TextStyle(color: Colors.white, fontSize: 18.sp),),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Container(
                  width: 120.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Icon(Ummicons.add_friend, color: Colors.white, size: 20.sp,),
                      ),
                      Text("添加好友", style: TextStyle(color: Colors.white, fontSize: 18.sp),),
                    ],
                  ),
                ),
              ),
            ];
          },
          onSelected: (value) {
            print(value);
            switch (value) {
              case 1:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateRoomPage()));
                break;
              case 2:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddFriendPage()));
                break;
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}