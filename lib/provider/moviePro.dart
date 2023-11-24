import 'package:flutter/material.dart';
import 'package:provider_ex01/model/movie.dart';
import 'package:provider_ex01/repository/movie_repository.dart';

class MoviePro extends ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  MovieRepository movieRepository = MovieRepository();

  loadMovies() async {
    //repository
    _movies = await movieRepository.loadMovies();
    notifyListeners();
  }
}
