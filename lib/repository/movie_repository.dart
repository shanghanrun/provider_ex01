import 'dart:convert';

import 'package:provider_ex01/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Movie>> loadMovies() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=45dfb0ff4a22c1a95d0041615999de56');

    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    if (data != null) {
      List<dynamic>? list = data['results'];
      if (list != null) {
        return list.map((item) => Movie.fromJson(item)).toList();
      }
    }
    return [];
  }

  Future<Map<String, dynamic>> getMovieDetail(int movieId) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/${movieId.toString()}?api_key=45dfb0ff4a22c1a95d0041615999de56');
    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    if (data != null) {
      return data;
    } else {
      print('못 받아옴');
      return {};
    }
  }

  // try {
  //     var response = await http.get(url); // header도 포함되어 온다.
  //     if (response.body != null) {
  //       var data = await jsonDecode(
  //           response.body); // body만 취하고, 큰 용량데이터면 제이슨변환에 시간이 걸리니 await.
  //       if (data != null) {
  //         List<dynamic> list =
  //             data['result']; // 전체 데이터에서 result부분이 리스트(Map이 요소)형자료이다.
  //         return list.map((item)=> Movie.fromJson(item)).toList();
  //       }
  //     }
  //     return [];
  //   } catch (e) {
  //     print(e);
  //   }
  //   return [];
  // }
}
