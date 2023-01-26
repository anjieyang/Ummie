
import 'package:flutter/material.dart';
import 'fake_data.dart';

class ChatRoomPage extends StatelessWidget {
  final String roomId;
  const ChatRoomPage({Key? key, required this.roomId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text("Chat Room: ${fake_rooms[int.parse(roomId)].roomName}"),
        ),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Center(
        child: Text("${roomId}"),
      ),
    );
  }
}
