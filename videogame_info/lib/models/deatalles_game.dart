class DetallesGame {
  int id;
  String name, released, image;
  double rating;
  int playtime;
  bool fave;

  DetallesGame.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        released = json["released"],
        image = json["background_image"],
        rating = json["rating"],
        playtime = json["playtime"],
        fave = false;
}

int gameInfoID = 0;
