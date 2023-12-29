import 'package:flutter/material.dart';
import 'package:videogame_info/api.dart';
import 'package:videogame_info/models/more_info_game.dart';
import 'package:videogame_info/widgets/game_info.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int gameID = 3328;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Game'),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
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
            Expanded(
              child: FutureBuilder(
                future: apiLoadInfoGame(gameID),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<InfoGame> snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final InfoGameDetalles = snapshot.data!;
                  return MoreInfoGame(gameInfo: InfoGameDetalles);
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
