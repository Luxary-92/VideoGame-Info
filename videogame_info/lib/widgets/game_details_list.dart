import 'package:videogame_info/models/deatalles_game.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.game,
  });

  final DetallesGame game;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(game.image)),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
          Image(
            image: NetworkImage(game.image),
            fit: BoxFit.cover,
            width: 300,
            height: 300,
          ),
          Text(
            game.name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
