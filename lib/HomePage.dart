import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:ummie/CONSTANT.dart';
import 'package:ummie/Ummicons_icons.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: Text("友间", style: TextStyle(color: Colors.black, fontSize: 28.sp, fontFamily: 'ZCOOL'),),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 21.w),
            child: Icon(Icons.add_circle_outline, color: Colors.black, size: 28,),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 21.w),
                height: 44.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: BACKGROUNDCOLOR,
                  borderRadius: const BorderRadius.all(Radius.circular((16))),
                ),
                child: InkWell(
                  onTap: () {
                    print("search");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Icon(Ummicons.search),
                            ),
                            Text("搜索房间名，联系人", style: TextStyle(color: SEARCHBARCOLOR, fontSize: 18.sp),),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          print("filter");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.w, right: 16.w),
                          child: Icon(Ummicons.filter),
                        ),
                      ),
                    ],
                  ),
                )
            ),

            Container(
              margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 25.h, bottom: 20.h),
              child: Row(
                  children: <Widget>[
                    RandomCard(backgroundColor: BACKGROUNDCOLOR, type: "一起聊", typeImage: "assets/images/talking.png"),
                    const Spacer(),
                    RandomCard(backgroundColor: BACKGROUNDCOLOR, type: "一起看", typeImage: "assets/images/watching.png"),
                  ]
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 12.h,
              color: BACKGROUNDCOLOR,
            ),

            Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, position) {
                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 14.h),
                                  height: 200.h,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset('assets/images/yourname.gif', fit: BoxFit.cover, width: double.infinity,),
                                  ),// Image.asset(rooms[position),
                                ),
                                Positioned(
                                  right: 28.w,
                                  top: 22.h,
                                  child: Container(
                                      width: 58.w,
                                      height: 24.h,
                                      decoration: BoxDecoration(
                                        color: THEMECOLOR,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Image.asset('assets/images/tv.png', width: 16.w, height: 16.h,),
                                          Text("看剧", style: TextStyle(color: Colors.white, fontSize: 12.sp,),),
                                        ],
                                      )
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 21.w, top: 14.h, bottom: 14.h),
                                  child: Text("你的名字.2016.BD1080p", style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 21.w),
                                    child: AvatarStack(
                                      settings: RestrictedAmountPositions(
                                        maxAmountItems: 6,
                                        maxCoverage: 0.5,
                                        minCoverage: 0.5,
                                        align: StackAlign.right,
                                      ),
                                      height: 40.h,
                                      textColor: Colors.white,
                                      avatars: [for (var n = 0; n < 18; n++) NetworkImage('https://i.pravatar.cc/150?img=$n')],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        HapticFeedback.mediumImpact();
                        print(position);
                      },
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RandomCard extends StatelessWidget {
  const RandomCard({
    Key? key,
    required this.backgroundColor,
    required this.typeImage,
    required this.type,
  }) : super(key: key);

  final Color backgroundColor;
  final String type;
  final String typeImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 108.h,
        width: 186.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular((12))),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60.h, left: 12.w, right: 30.w),
              child: Text(type, style: TextStyle(fontSize: 22.sp),),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Image.asset(typeImage, height: 60.h, width: 60.w, alignment: Alignment.topRight,),
            ),
          ],
        ),
      ),
      onTap: () {
        if (type == "一起聊") {
          print("picked chatting");
        } else {
          print("picked watching");
        }
      },
    );
  }
}