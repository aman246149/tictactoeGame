import 'package:flutter/material.dart';
import 'package:tictactoe/screens/CreateRoomScreen.dart';
import 'package:tictactoe/screens/JoinRoomScreen.dart';
import 'package:tictactoe/widgets/CustomButton.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  static String routeName = '/main-menu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, CreateRoomScreen.routeName);
            },
            text: "Create Room",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, JoinRoomScreen.routeName);
            },
            text: "Join Room",
          )
        ],
      ),
    );
  }
}
