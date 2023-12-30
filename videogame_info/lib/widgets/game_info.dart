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
          const SizedBox(height: 20),
          Text(
            gameInfo.name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: screenSize.width - 60,
            child: Text(
              gameInfo.description,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
