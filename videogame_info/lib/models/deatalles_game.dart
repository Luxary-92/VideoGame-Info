class DetallesGame {
  //int id, metacritic;
  String name, released, image;
  double rating;

  DetallesGame.fromJson(Map<String, dynamic> json)
      : //id = json["id"],
        name = json["name"],
        released = json["released"],
        image = json["background_image"],
        rating = json["rating"];
}
