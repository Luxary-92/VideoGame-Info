import 'package:flutter/material.dart';
import 'package:videogame_info/screens/home_screen.dart';
import 'package:videogame_info/screens/game_screen.dart';
//import 'package:flutter/material.dart';

void main() {
  runApp(const VideoGameInfo());
}

class VideoGameInfo extends StatelessWidget {
  const VideoGameInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const HomeScreen(),
        "/game_info": (context) => const GameScreen(),
      },
    );
  }
}
