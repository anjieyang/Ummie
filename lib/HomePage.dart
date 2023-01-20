import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:ummie/CONSTANT.dart';
import 'package:ummie/SearchPage.dart';
import 'package:ummie/Ummicons_icons.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ummie/Card.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFilterChat = false;
  bool isFilterWatch = false;
  List<String> filterRules = <String>['推荐', '最热', '最新'];
  int selectedRule = 0;

  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => const SearchPage(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(0, 0.5);
  //       const end = Offset.zero;
  //       const curve = Curves.ease;
  //
  //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     }
  //   );
  // }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  leadingWidth: 0,
                  titleSpacing: 0,
                  backgroundColor: Colors.white,
                  centerTitle: false,
                  elevation: 0,
                  forceElevated: innerBoxIsScrolled,
                  floating: true,
                  snap: false,
                  pinned: false,
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
              )
            ],
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 21.w, right: 21.w, bottom: 13.h),
                      height: 44.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: BACKGROUNDCOLOR,
                        borderRadius: const BorderRadius.all(Radius.circular((16))),
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigateToSearchPage(context);
                          print("search");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                        return Container(
                                          height: 620.h,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 18.h),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Icon(Icons.close, size: 32,),
                                                    ),
                                                    Text("筛选和排序", style: TextStyle(fontSize: 20.sp),),
                                                    Opacity(
                                                      opacity: 0,
                                                      child: Icon(Icons.close, size: 32.sp,),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 21.w, right: 21.w, top: 20.h, bottom: 18.h),
                                                child: Text("筛选房间", style: TextStyle(fontSize: 22.sp),),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 21.w),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    TypeCard(
                                                      basicCard: BasicCard(type: "一起聊", image: "assets/images/talking.png",),
                                                      isSelect: isFilterChat,
                                                      onTap: () {
                                                        setState(() {
                                                          isFilterChat = isFilterChat ? false : true;
                                                          print(isFilterChat);
                                                        });
                                                      },
                                                    ),
                                                    TypeCard(
                                                      basicCard: BasicCard(type: "一起看", image: "assets/images/watching.png",),
                                                      isSelect: isFilterWatch,
                                                      onTap: () {
                                                        setState(() {
                                                          isFilterWatch = isFilterWatch ? false : true;
                                                          print(isFilterWatch);
                                                        });
                                                      }
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 20.h, bottom: 18.h),
                                                child: Text("排序规则", style: TextStyle(fontSize: 22.sp),),
                                              ),
                                              ListView.builder(
                                                itemCount: filterRules.length,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedRule = index;
                                                        print(filterRules[index]);
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 21.w, right: 21.w, bottom: 14.h),
                                                      height: 52.h,
                                                      width: double.infinity,
                                                      decoration: index == selectedRule? SELECTEDDECORATION : DEFAULTDECORATION,
                                                      child: Container(
                                                        margin: EdgeInsets.only(left: 22.w),
                                                        alignment: Alignment.centerLeft,
                                                        child: Text('${filterRules[index]}', style: TextStyle(fontSize: 20.sp),),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: 21.w, top: 20.h, right: 21.w, bottom: 14.h),
                                                height: 52.h,
                                                width: double.infinity,
                                                color: THEMECOLOR,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text('应用', style: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold),),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                    }
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 25.w, right: 16.w),
                                child: Icon(Ummicons.filter),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 8.h, bottom: 20.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  BasicCard(type: "一起聊", image: "assets/images/talking.png",),
                                  BasicCard(type: "一起看", image: "assets/images/watching.png",),
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
                                                        Image.asset('assets/images/type_watching.png', width: 16.w, height: 16.h,),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class TypeCard extends StatelessWidget {
//   const TypeCard({
//     Key? key,
//     required this.backgroundColor,
//     required this.typeImage,
//     required this.type,
//   }) : super(key: key);
//
//   final Color backgroundColor;
//   final String type;
//   final String typeImage;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         height: 108.h,
//         width: 186.w,
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: const BorderRadius.all(Radius.circular((12))),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(top: 60.h, left: 14.w),
//               child: Text(type, style: TextStyle(fontSize: 22.sp),),
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 26.h, right: 18.w),
//               child: Image.asset(typeImage, height: 60.h, width: 60.w, alignment: Alignment.topRight,),
//             ),
//           ],
//         ),
//       ),
//       onTap: () {
//         if (type == "一起聊") {
//           print("picked chatting");
//         } else {
//           print("picked watching");
//         }
//       },
//     );
//   }
// }

