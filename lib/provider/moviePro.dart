import 'package:flutter/material.dart';
import 'package:provider_ex01/model/movie.dart';
import 'package:provider_ex01/repository/movie_repository.dart';

class MoviePro extends ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  List<String> imageList = [];
  Map<String, dynamic> _detailedMovie = {};
  Map<String, dynamic> get detailedMovie => _detailedMovie;

  MovieRepository movieRepository = MovieRepository();

  loadMovies() async {
    //repository
    _movies = await movieRepository.loadMovies();
    for (Movie _movie in _movies) {
      String temp = _movie.posterPath ?? "";
      String imagePath =
          'https://image.tmdb.org/t/p/w500$temp'; //temp에  /포함되어 있다.
      imageList.add(imagePath);
    }
    notifyListeners();
  }

  getMovieDetail(int movieId) async {
    _detailedMovie = await movieRepository.getMovieDetail(movieId);
    notifyListeners();
  }
}
