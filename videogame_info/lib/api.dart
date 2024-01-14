import 'dart:convert';

import 'package:videogame_info/models/creatorInfo.dart';
import 'package:videogame_info/models/deatalles_game.dart';
import 'package:http/http.dart' as http;
import 'package:videogame_info/models/more_info_game.dart';

Future<List<DetallesGame>> apiLoadDetailsGames() async {
  final uri = Uri.parse(
      "https://api.rawg.io/api/games?key=66512237741a4c0e8fbfc7b5d2c21c92");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonGameDetalles = json["results"];
  final List<DetallesGame> gameDetalles = [];
  for (final jsonDetallesGame in jsonGameDetalles) {
    final detallesGames = DetallesGame.fromJson(jsonDetallesGame);
    gameDetalles.add(detallesGames);
  }
  return gameDetalles;
}

Future<InfoGame> apiLoadInfoGame(int gameId) async {
  final uri = Uri.parse(
      "https://api.rawg.io/api/games/$gameId?key=66512237741a4c0e8fbfc7b5d2c21c92");
  final response = await http.get(uri);

  final json = jsonDecode(response.body);
  /*
  final jsonGameInfo = json[""];

  final List<InfoGame> gameInfo = [];
  for (final jsonInfoGame in jsonGameInfo) {
    final detallesGames = InfoGame.fromJson(jsonInfoGame);
    gameInfo.add(detallesGames);
  }
  */
  return InfoGame.fromJson(json);
}


Future<List<CreatorInfo>> apiLoadAllCreators() async {
  final uri = Uri.parse(
      "https://api.rawg.io/api/creators?key=66512237741a4c0e8fbfc7b5d2c21c92");
  final response = await http.get(uri);

  final json = jsonDecode(response.body);
  final List<dynamic> jsonCreators = json["results"];

  final List<CreatorInfo> creators = jsonCreators
      .map((jsonCreator) => CreatorInfo.fromJson(jsonCreator))
      .toList();

  return creators;
}

Future<String> apiLoadGameName(int gameId) async {

  final response = await http.get(
    Uri.parse('https://api.rawg.io/api/games/$gameId?key=66512237741a4c0e8fbfc7b5d2c21c92'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> gameData = json.decode(response.body);
    return gameData['name'];
  } else {
    throw Exception('Failed to load game name');
  }
}
/*
Future<GenreDetails> apiLoadGenreDetails(int  genreId) async {
  
 final uri = Uri.parse(
      "https://api.rawg.io/api/genres/$genreId?key=66512237741a4c0e8fbfc7b5d2c21c92");

  final response = await http.get(uri);

  final json = jsonDecode(response.body);

  return GenreDetails.fromJson(json);
}*/

/*
Future<InfoGame> apiLoadInfoGame(int gameId) async {
  final uri = Uri.parse(
      "https://api.rawg.io/api/games/$gameId?key=66512237741a4c0e8fbfc7b5d2c21c92");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonGameInfo = json["results"];
  /*
  final InfoGame gameInfo = [] as InfoGame;
  for (final jsonDetallesGame in jsonGameInfo) {
    final detallesGames = InfoGame.fromJson(jsonDetallesGame);
    gameInfo.add(detallesGames);
  }
  */
  return InfoGame.fromJson(jsonGameInfo);
}
*/