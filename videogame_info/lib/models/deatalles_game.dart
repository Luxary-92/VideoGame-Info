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

class InfoGame {
  String name, description, released, image, image_2;
  double rating;
  int playtime;

  InfoGame.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        description = json["description"],
        released = json["released"],
        image = json["background_image"],
        image_2 = json["background_image_additional"],
        rating = json["rating"],
        playtime = json["playtime"];
}
