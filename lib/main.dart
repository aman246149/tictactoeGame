import 'package:flutter/material.dart';
import 'package:tictactoe/screens/CreateRoomScreen.dart';
import 'package:tictactoe/screens/GameScreen.dart';
import 'package:tictactoe/screens/JoinRoomScreen.dart';
import 'package:tictactoe/screens/MainMenuScreen.dart';
import 'package:tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      routes: {
        MainMenuScreen.routeName: ((context) => const MainMenuScreen()),
        JoinRoomScreen.routeName: ((context) => const JoinRoomScreen()),
        CreateRoomScreen.routeName: ((context) => const CreateRoomScreen()),
        GameScreen.routeName: ((context) => const GameScreen()),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
