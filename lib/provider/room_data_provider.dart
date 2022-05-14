import 'package:flutter/material.dart';
import 'package:tictactoe/models/player.dart';

class RoomProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};

  Player _player1 = Player(nickname: "", socketID: "", playerType: "X");

  Player _player2 = Player(nickname: "", socketID: "", playerType: "O");

  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1Data(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2Data(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }
}
