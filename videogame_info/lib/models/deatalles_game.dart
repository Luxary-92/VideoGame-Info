class DetallesGame {
  int id;
  String name, released, image;
  double rating;
  int playtime;

  DetallesGame.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        released = json["released"],
        image = json["background_image"],
        rating = json["rating"],
        playtime = json["playtime"];
}

int gameInfoID = 3328;

class GameID {
  int id;

  GameID.fromJson(Map<String, dynamic> json) : id = 0;
}
