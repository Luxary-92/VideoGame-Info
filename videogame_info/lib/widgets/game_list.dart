import 'package:videogame_info/models/deatalles_game.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.game,
    required this.idGame,
  });

  final DetallesGame game;
  final int idGame;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          gameInfoID = game.id;
          Navigator.of(context).pushNamed("/game_info");
        },
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(205, 68, 0, 95),
                image: DecorationImage(
                    image: NetworkImage(game.image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            game.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text(
                            "Rating : ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            game.rating.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text(
                            "Playtime : ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            game.playtime.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            " H",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30, height: 30)
          ],
        ));
  }
}
