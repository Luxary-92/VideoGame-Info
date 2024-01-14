import 'package:flutter/material.dart';
import 'package:videogame_info/models/deatalles_game.dart';
import 'package:videogame_info/models/more_info_game.dart';
import 'dart:developer' as developer;

class MoreInfoGame extends StatefulWidget {
  const MoreInfoGame({
    super.key,
    required this.gameInfo,
    required this.gameInfoID,
  });

  final InfoGame gameInfo;
  final int gameInfoID;

  @override
  // ignore: library_private_types_in_public_api
  _MoreInfoGameState createState() => _MoreInfoGameState();
}

class _MoreInfoGameState extends State<MoreInfoGame> {
  bool isFavorite = favoritesHome;

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
                      image: NetworkImage(widget.gameInfo.image),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                                width: 60,
                                height: 60,
                                child: FloatingActionButton(
                                  heroTag: "btn1",
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  backgroundColor: const Color(0xFF681DB7),
                                  mini: true,
                                  child: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red[700],
                                    size: 30,
                                  ),
                                ),
                              ),
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
                                  heroTag: "btn2",
                                  onPressed: () {},
                                  backgroundColor: const Color(0xFF681DB7),
                                  mini: true,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star_rounded,
                                        color: Colors.yellow,
                                        size: 30,
                                      ),
                                      Text(
                                        widget.gameInfo.rating.toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.gameInfo.name,
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
                    removeHtml(widget.gameInfo.description),
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
        ),
      ),
    );
  }

  String removeHtml(String input) {
    // Remove HTML tags
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String withoutHtml = input.replaceAll(exp, '');
    return withoutHtml;
  }
}
