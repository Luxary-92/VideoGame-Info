import 'package:flutter/material.dart';
import 'package:videogame_info/api.dart';
import 'package:videogame_info/models/deatalles_game.dart';
import 'package:videogame_info/widgets/game_details_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const VideoGameInfo());
}

class VideoGameInfo extends StatelessWidget {
  const VideoGameInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
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
    );
  }
}
