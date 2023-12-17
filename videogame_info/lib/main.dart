import 'package:flutter/material.dart';
import 'package:videogame_info/api.dart';
import 'package:videogame_info/models/deatalles_game.dart';
import 'package:videogame_info/widgets/game_details_list.dart';
//import 'package:flutter/material.dart';

void main() {
  runApp(const VideoGameInfo());
}

class VideoGameInfo extends StatelessWidget {
  const VideoGameInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3C007A), // #3C007A
                Color.fromRGBO(60, 0, 122, 1.0), // rgba(60, 0, 122, 1.00)
                Color(0xFF681DB7), // #681DB7
              ],
              stops: [0.0, 0.35, 1.0],
            ),
          ),
          child: FutureBuilder(
            future: apiLoadDetailsGames(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<DetallesGame>> snapshot,
            ) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final detailsGamesList = snapshot.data!;
              return ListView.builder(
                itemCount: detailsGamesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserListItem(game: detailsGamesList[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
