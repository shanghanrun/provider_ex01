import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/moviePro.dart';

class MovieDetail extends StatelessWidget {
  MoviePro moviePro;
  MovieDetail({required this.moviePro, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Detail')),
      body: Container(child: Text(moviePro.detailedMovie['homepage'])),
    );
  }
}
