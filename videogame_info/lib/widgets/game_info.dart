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
      child: SingleChildScrollView(
          child: Column(
        children: [
          Column(
            children: [
              Container(
                  height: 450,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(gameInfo.image),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 15,
                            width: 50,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: 60, // <-- match_parent
                                  height: 60, // <-- match-parent
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: const Color(0xFF681DB7),
                                    mini: true,
                                    child: Icon(Icons.favorite,
                                        color: Colors.red[700], size: 30),
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: const Color(0xFF681DB7),
                                    mini: true,
                                    child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star_rounded,
                                              color: Colors.yellow, size: 30),
                                          Text(
                                            "4,8",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ]),
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Text(
                gameInfo.name,
                style: const TextStyle(
                  fontSize: 30,
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
        ],
      )),
    );
  }
}
