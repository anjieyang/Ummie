import 'models/room_model.dart';

abstract class RoomRepository {
  const RoomRepository();

  Future<void> createNewRoom(String type, String name);
}