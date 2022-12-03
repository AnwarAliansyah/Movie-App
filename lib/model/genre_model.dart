class Genre {
    Genre({
         this.genres,
    });

    List<GenreModel>? genres;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        genres: List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
    };
}

class GenreModel {
    GenreModel({
         this.id,
        this.name,
    });

    int? id;
    String? name;

    factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
