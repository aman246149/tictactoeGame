import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/CustomButton.dart';
import 'package:tictactoe/widgets/CustomInputField.dart';
import 'package:tictactoe/widgets/CustomText.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
                text: "Create Room",
                fontSize: 75),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
                controller: _nameController, hintText: "Enter your name"),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(onTap: () {}, text: "Create Room")
          ],
        ),
      ),
    );
  }
}
