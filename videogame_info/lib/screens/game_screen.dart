import 'package:flutter/material.dart';
/*
import 'package:videogame_info/api.dart';
import 'package:videogame_info/models/deatalles_game.dart';
import 'package:videogame_info/widgets/game_details_list.dart';
*/

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Games'),
      ),
      body: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red,
              Colors.red,
              Colors.red,
            ],
            stops: [0.0, 0.35, 1.0],
          ),
        ),
        child: Column(
          children: [
            BackButton(),
          ],
        ),
      ),
    );
  }
}
