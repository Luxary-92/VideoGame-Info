import 'package:flutter/material.dart';
import 'package:videogame_info/api.dart';
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
              Color.fromARGB(255, 0, 255, 34),
              Color.fromARGB(255, 0, 247, 255),
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
                  snapshot_2,
                ) {
                  if (!snapshot_2.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot_2.hasError) {
                    return Container();
                  }
                  final detailsGamesList = snapshot_2.data!;
                  return MoreInfoGame(gameInfo: detailsGamesList);
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
