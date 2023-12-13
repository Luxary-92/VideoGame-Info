class DetallesGame {
  //int id, metacritic;
  String name, /*description ,*/ released, image /*, website*/;

  DetallesGame.fromJson(Map<String, dynamic> json)
      : //id = json["id"],
        name = json["name"],
        //description = json["description"],
        released = json["released"],
        //metacritic = json["metacritic"],
        image = json["background_image"] /*website = json["website"]*/;
}
