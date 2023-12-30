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
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 450,
            width: screenSize.width,
            child:
                Image(image: NetworkImage(gameInfo.image), fit: BoxFit.cover),
          ),
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
    );
  }
}
