import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/socketClient.dart';
import 'package:tictactoe/screens/GameScreen.dart';
import 'package:tictactoe/utils/utils.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

//emits

  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClient.emit("createRoom", {"nickname": name});
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty || roomId.isNotEmpty) {
      _socketClient.emit("joinRoom", {"nickname": nickname, "roomId": roomId});
    }
  }

//listeners

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on("createRoomSuccess", (player) {
      Navigator.pushNamed(context, GameScreen.routeName);
      Provider.of<RoomProvider>(context, listen: false).updateRoomData(player);
      print(player);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on("joinRoomSuccess", (data) {
      print("join room ${data}");
      Provider.of<RoomProvider>(context, listen: false).updateRoomData(data);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccuredListner(BuildContext context) {
    _socketClient.on("errorOccurred", (data) {
      showSnackBar(context, data);
    });
  }
}
