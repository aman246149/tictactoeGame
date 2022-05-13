import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/CustomButton.dart';
import 'package:tictactoe/widgets/CustomInputField.dart';
import 'package:tictactoe/widgets/CustomText.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _gameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                text: "Join Room",
                fontSize: 75),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
                controller: _nameController, hintText: "Enter your name"),
            const SizedBox(
              height: 18,
            ),
            CustomTextField(
                controller: _gameController, hintText: "Enter GameId"),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(onTap: () {}, text: "Join Room")
          ],
        ),
      ),
    );
  }
}
