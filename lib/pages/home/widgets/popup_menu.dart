
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ummie/config/palette.dart';
import 'package:ummie/config/ummicons.dart';
import 'package:ummie/pages/room/room.dart';
import 'package:ummie/pages/message/message.dart';

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