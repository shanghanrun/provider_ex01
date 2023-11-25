import 'package:flutter/material.dart';
import 'package:provider_ex01/model/movie.dart';
import 'package:provider_ex01/page/movie_detail.dart';
import 'package:provider_ex01/provider/moviePro.dart';
import 'package:provider/provider.dart'; // provider 패키지 임포트 추가

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    var moviePro = Provider.of<MoviePro>(context);
    List<Movie> movieList = moviePro.movies;
    Widget _makeOneMovie(Movie movie) {
      return Row(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              // borderRadius: const BorderRadius.vertical(
              //     top: Radius.circular(20), bottom: Radius.circular(20)),
              child: Image.network(movie.posterUrl)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    movie.title!,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      movie.overview!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget _makeListView2({required MoviePro moviePro}) {
      return ListView.separated(
        itemCount: movieList.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                await moviePro.getMovieDetail(movieList[i].id!);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetail(moviePro: moviePro)));
              },
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 244, 233),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: const Color.fromARGB(255, 100, 99, 99)
                              .withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: const Offset(0, 0)),
                    ],
                  ),
                  child: _makeOneMovie(movieList[i])),
            ),
          );
        },
        separatorBuilder: (context, i) {
          return const Divider();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Movie Page')),
      body: (moviePro.movies.isNotEmpty)
          ? _makeListView2(moviePro: moviePro)
          // ? _makeListView(moviePro: moviePro)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _makeListView extends StatelessWidget {
  const _makeListView({
    required this.moviePro,
  });

  final MoviePro moviePro;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemExtent: 140,
        itemCount: moviePro.movies.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            //카드사이 간격을 늘려줌
            child: Card(
              elevation: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  Image.network(moviePro.imageList[i],
                      width: 140, height: 200, fit: BoxFit.fill),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          '${moviePro.movies[i].title}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 88, 119, 253),
                          ),
                        ), //Map을 클래스로 변환했기 때문에
                        const SizedBox(height: 5), // 텍스트 사이 간격 조정
                        Text(
                          '${moviePro.movies[i].overview}',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis, //넘치는 것 ...
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
