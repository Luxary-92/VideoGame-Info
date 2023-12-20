import 'package:flutter/material.dart';
import 'package:videogame_info/api.dart';
import 'package:videogame_info/models/deatalles_game.dart';
import 'package:videogame_info/widgets/game_details_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3C007A),
              Color.fromRGBO(60, 0, 122, 1.0),
              Color(0xFF681DB7),
            ],
            stops: [0.0, 0.35, 1.0],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                style: TextStyle(color: Colors.white70),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(5),
                  fillColor: Color.fromRGBO(113, 62, 162, 1),
                  prefixIconColor: Colors.white70,
                  suffixIconColor: Colors.white70,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                      10.0,
                    )),
                  ),
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onSubmitted: (text) {
                  debugPrint("Final value is '$text'");
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: FilledButton(
                    //style: FilledButton.styleFrom(),
                    onPressed: () {
                      debugPrint("You pressed the button!");
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text("Filter"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: FutureBuilder(
                future: apiLoadDetailsGames(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<DetallesGame>> snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final detailsGamesList = snapshot.data!;
                  return ListView.builder(
                    itemCount: detailsGamesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return UserListItem(game: detailsGamesList[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
