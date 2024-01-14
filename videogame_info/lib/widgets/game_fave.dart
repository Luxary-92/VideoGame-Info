import 'package:videogame_info/models/deatalles_game.dart';
import 'package:flutter/material.dart';

class FaveGames extends StatefulWidget {
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
  // ignore: library_private_types_in_public_api
  _FaveGames createState() => _FaveGames();
}

class _FaveGames extends State<FaveGames> {
  bool isFavorite = favoritesHome;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          gameInfoID = widget.game.id;
          favoritesHome = widget.game.fave;
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
                    image: NetworkImage(widget.game.image), fit: BoxFit.cover),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: FloatingActionButton(
                            heroTag: widget.game.id,
                            onPressed: () {
                              setState(() {
                                widget.game.fave = !widget.game.fave;
                              });
                            },
                            backgroundColor:
                                const Color.fromARGB(255, 41, 0, 82),
                            mini: true,
                            child: Row(
                              children: [
                                Icon(
                                  widget.game.fave
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red[700],
                                  size: 30,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            widget.game.name,
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
                            widget.game.rating.toString(),
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
                            widget.game.playtime.toString(),
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
