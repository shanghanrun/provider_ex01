class Movie {
  String? title;
  String? posterPath;
  String? overview;
  int? id;
  // String? homepage;

  Movie({this.title, this.posterPath, this.overview, this.id});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      // homepage: json['homepage'] as String);
    );
  }

  String get posterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}
