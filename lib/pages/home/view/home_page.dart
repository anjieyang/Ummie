import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:ummie/config/config.dart';
import 'package:ummie/data/fake_data/fake_data.dart';
import 'package:ummie/pages/room/room.dart';
import 'package:ummie/domain/room_repository/room_repository.dart';
import 'package:ummie/pages/search/search.dart';
import 'package:ummie/config/ummicons.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ummie/pages/home/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  bool isFilterChat = false;
  bool isFilterWatch = false;
  List<String> sortRules = <String>['推荐', '最热', '最新'];
  int selectedSortRule = 0;

  void _navigateToSearchPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage()));
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
                  actions: const <Widget>[
                    HomePagePopMenu(),
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
                        color: backgroundColor,
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
                                    child: const Icon(Ummicons.search),
                                  ),
                                  Text("搜索房间名，联系人", style: TextStyle(color: searchBarColor, fontSize: 18.sp),),
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
                                        return SizedBox(
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
                                                      child: const Icon(Icons.close, size: 32,),
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
                                                itemCount: sortRules.length,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedSortRule = index;
                                                        print(sortRules[index]);
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 21.w, right: 21.w, bottom: 10.h),
                                                      height: 52.h,
                                                      width: double.infinity,
                                                      decoration: index == selectedSortRule? selectedDecoration : defaultDecoration,
                                                      child: Container(
                                                        margin: EdgeInsets.only(left: 22.w),
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(sortRules[index], style: TextStyle(fontSize: 20.sp),),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: 21.w, right: 21.w, bottom: 36.h),
                                                height: 52.h,
                                                width: double.infinity,
                                                color: themeColor,
                                                child: InkWell(
                                                  onTap: () {
                                                    HapticFeedback.mediumImpact();
                                                    Navigator.pop(context);
                                                    print("Filter: 一起聊: $isFilterChat, 一起看: $isFilterWatch, Sort: ${sortRules[selectedSortRule]}");
                                                    setState(() {
                                                      RoomsList.updateRoomsList(isFilterChat, isFilterWatch);
                                                    });
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
                                child: const Icon(Ummicons.filter),
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
                            color: backgroundColor,
                          ),

                          Flexible(
                            child: RoomsList(),
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

class RoomsList extends StatefulWidget {
  static _RoomsListState _roomsListState = _RoomsListState();

  @override
  _RoomsListState createState() {
    return _roomsListState = _RoomsListState();
  }

  static void updateRoomsList(bool isFilterChat, bool isFilterWatch) {
    _roomsListState.updateRoomsList(isFilterChat, isFilterWatch);
  }
}

class _RoomsListState extends State<RoomsList> {
  List<Room> _rooms = fake_rooms;
  bool filterChat = false;
  bool filterWatch = false;

  List<Room> _filteredRooms(bool isFilterChat, bool isFilterWatch, List<Room> roomList) {
    if ((isFilterChat && isFilterWatch) || (!isFilterChat && !isFilterWatch)) {
      return roomList;
    }
    return isFilterChat ?
    roomList.where((element) => element.roomType == '聊天').toList() : roomList.where((element) => element.roomType == '看剧').toList();
  }

  updateRoomsList(bool isFilterChat, bool isFilterWatch) {
    setState(() {
      _rooms = _filteredRooms(isFilterChat, isFilterWatch, fake_rooms);
      filterChat = isFilterChat;
      filterWatch = isFilterWatch;
      print(_rooms.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _rooms.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              margin: const EdgeInsets.only(bottom: 6),
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
                          // child: Image.asset(rooms[index].roomCover, fit: BoxFit.cover, width: double.infinity,),
                          child: Image.asset(_rooms[index].roomCover, fit: BoxFit.cover, width: double.infinity,),
                        ),// Image.asset(rooms[position),
                      ),
                      Positioned(
                        right: 28.w,
                        top: 22.h,
                        child: Container(
                            width: 58.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: themeColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(_rooms[index].roomType == '聊天' ? 'assets/images/type_talking.png' : 'assets/images/type_watching.png', width: 16.w, height: 16.h,),
                                Text(_rooms[index].roomType, style: TextStyle(color: Colors.white, fontSize: 12.sp,),),
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
                        child: Text(_rooms[index].roomName, style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),),
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
                            // avatars: [for (var n = 0; n < 18; n++) NetworkImage('https://i.pravatar.cc/150?img=$n')],
                            avatars: [for (int i = 0; i < _rooms[index].roomMembers.length; ++i) AssetImage(_rooms[index].roomMembers[i].avatarURL)],
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
              print(index);
              print(_rooms[index].roomType);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return _rooms[index].roomType == "聊天" ? ChatRoomPage(roomId: index.toString()) : VideoRoomPage(roomId: index.toString());
                  }
                )
              );
            },
          );
        }
    );
  }
}
