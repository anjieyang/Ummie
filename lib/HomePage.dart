import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:ummie/CONSTANT.dart';
import 'package:ummie/Ummicons_icons.dart';
import 'package:avatar_stack/avatar_stack.dart';

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
        title: const Padding(
          padding: EdgeInsets.only(left: 21),
          child: Text("友间", style: TextStyle(color: Colors.black, fontSize: 28, fontFamily: 'ZCOOL'),),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 21.0),
            child: Icon(Icons.add_circle_outline, color: Colors.black, size: 28,),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 21),
                height: 44,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: BACKGROUNDCOLOR,
                  borderRadius: const BorderRadius.all(Radius.circular((16))),
                ),
                child: Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(Ummicons.search),
                    ),
                    Text("搜索房间名，联系人", style: TextStyle(color: SEARCHBARCOLOR, fontSize: 18),),
                  ],
                )
            ),

            Container(
              margin: const EdgeInsets.only(left: 21, right: 21, top: 25, bottom: 20),
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
              height: 12,
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
                                  margin: const EdgeInsets.only(left: 21, right: 21, top: 14),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset('assets/images/yourname.jpg', fit: BoxFit.cover,),
                                  ),// Image.asset(rooms[position),
                                ),
                                Positioned(
                                  right: 28,
                                  top: 22,
                                  child: Container(
                                      width: 58,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: THEMECOLOR,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Image.asset('assets/images/tv.png', width: 16, height: 16,),
                                          const Text("看剧", style: TextStyle(color: Colors.white, fontSize: 12,),),
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
                                  margin: const EdgeInsets.only(left: 21, top: 14, bottom: 14),
                                  child: const Text("你的名字.2016.BD1080p", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 21),
                                    child: AvatarStack(
                                      settings: RestrictedAmountPositions(
                                        maxAmountItems: 6,
                                        maxCoverage: 0.5,
                                        minCoverage: 0.5,
                                        align: StackAlign.right,
                                      ),
                                      height: 40,
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
        height: 108,
        width: (MediaQuery.of(context).size.width - 16 - 42) / 2,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular((12))),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 12, right: 30),
              child: Text(type, style: const TextStyle(fontSize: 22),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Image.asset(typeImage, height: 60, width: 60, alignment: Alignment.topRight,),
            ),
          ],
        ),
      ),
      onTap: () {
        print("Tapped Random Card");
      },
    );
  }
}