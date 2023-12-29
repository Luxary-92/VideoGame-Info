import 'package:flutter/material.dart';
import 'package:videogame_info/models/more_info_game.dart';

class MoreInfoGame extends StatelessWidget {
  const MoreInfoGame({
    super.key,
    required this.gameInfo,
  });

  final InfoGame gameInfo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 450,
            width: 800,
            decoration: BoxDecoration(
              color: const Color.fromARGB(205, 68, 0, 95),
              image: DecorationImage(
                  image: NetworkImage(gameInfo.image), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Text(
                  gameInfo.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 122, 122, 122),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
