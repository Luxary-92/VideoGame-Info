import 'package:videogame_info/models/deatalles_game.dart';
import 'package:flutter/material.dart';

class FaveGames extends StatelessWidget {
  const FaveGames({
    super.key,
    required this.game,
    required this.idGame,
    required this.fav,
  });

  final DetallesGame game;
  final int idGame;
  final bool fav;

  @override
  Widget build(BuildContext context) {
    return Container(child: () {
      if (game.fave == true) {
        return const SizedBox(height: 0);
      }
      if (game.id == 3328) {
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
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.9),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
    }());
  }
}
