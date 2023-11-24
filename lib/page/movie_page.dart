import 'package:flutter/material.dart';
import 'package:provider_ex01/model/movie.dart';
import 'package:provider_ex01/provider/moviePro.dart';
import 'package:provider/provider.dart'; // provider 패키지 임포트 추가

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    var moviePro = Provider.of<MoviePro>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Page')),
      body: (moviePro.movies.isNotEmpty)
          ? ListView.builder(
              // itemExtent: 140,
              itemCount: moviePro.movies.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${moviePro.movies[i].title}'), //Map을 클래스로 변환했기 때문에
                            const SizedBox(height: 5), // 텍스트 사이 간격 조정
                            Text('${moviePro.movies[i].overview}'),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
