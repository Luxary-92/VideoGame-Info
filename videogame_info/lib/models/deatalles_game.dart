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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "released": released,
        "background_image": image,
        "rating": rating,
        "playtime": playtime
      };
}

int gameInfoID = 3328;

bool favoritesHome = false;
