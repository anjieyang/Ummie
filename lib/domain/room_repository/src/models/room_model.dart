import 'user_model.dart';

class Room {
  String _roomName;
  String _roomCover;
  String _roomType;
  int _roomCapacity;
  List<User> _roomMembers;

  Room(this._roomName, this._roomType, this._roomCover, this._roomCapacity, this._roomMembers);

  List<User> get roomMembers => _roomMembers;

  set roomMembers(List<User> value) {
    _roomMembers = value;
  }

  int get roomCapacity => _roomCapacity;

  set roomCapacity(int value) {
    _roomCapacity = value;
  }

  String get roomName => _roomName;

  set roomName(String value) {
    _roomName = value;
  }

  String get roomCover => _roomCover;

  set roomCover(String value) {
    _roomCover = value;
  }

  String get roomType => _roomType;

  set roomType(String value) {
    _roomType = value;
  }
}