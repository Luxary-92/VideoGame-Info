import 'package:flutter/material.dart';
import 'package:videogame_info/api.dart';
import 'package:videogame_info/models/deatalles_game.dart';
import 'package:videogame_info/widgets/game_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Games',
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
          ),
        ),
        centerTitle: true, 
        backgroundColor: const Color.fromARGB(255, 41, 0, 82),
        iconTheme: const IconThemeData(
            color: Colors
                .white), 
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
              height: 20,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                style: const TextStyle(color: Colors.white70),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("You pressed the button!");
                      Navigator.of(context).pushNamed("/favorites");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(113, 62, 162, 1)),
                    child: const Row(
                      children: [
                        Text("FAVORITES"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("You pressed the button!");
                      Navigator.of(context).pushNamed("/filters");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(113, 62, 162, 1)),
                    child: const Row(
                      children: [
                        Text("FILTERS"),
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
                      return UserListItem(
                        game: detailsGamesList[index],
                        idGame: detailsGamesList[index].id,
                      );
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
