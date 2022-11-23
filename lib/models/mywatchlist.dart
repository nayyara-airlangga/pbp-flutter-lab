class MyWatchlistFields {
  bool watched;
  String title;
  double rating;
  DateTime releaseDate;
  String review;

  MyWatchlistFields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  factory MyWatchlistFields.fromMap(Map<String, dynamic> map) =>
      MyWatchlistFields(
        watched: map["watched"],
        title: map["title"],
        rating: map["rating"],
        releaseDate: DateTime.parse(map["release_date"]),
        review: map["review"],
      );
}

class MyWatchlist {
  int pk;
  MyWatchlistFields fields;

  MyWatchlist({
    required this.pk,
    required this.fields,
  });

  factory MyWatchlist.fromMap(Map<String, dynamic> map) => MyWatchlist(
        pk: map["pk"],
        fields: MyWatchlistFields.fromMap(map["fields"]),
      );
}
