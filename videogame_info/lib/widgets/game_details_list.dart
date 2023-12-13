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
    return ListTile(
      title: Text(game.name),
      /*
      subtitle: Text(game.website),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(game.image),
      ),
      */
    );
  }
}
