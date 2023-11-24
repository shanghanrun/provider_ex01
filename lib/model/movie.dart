class Movie {
  String? title;
  String? posterPath;
  String? overview;

  Movie({this.title, this.posterPath, this.overview});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'] as String,
        posterPath: json['poster_path'] as String,
        overview: json['overview'] as String);
  }
}
