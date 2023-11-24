import 'package:provider_ex01/provider/bottom.dart';
import 'package:provider_ex01/provider/counter.dart';
import 'package:provider_ex01/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex01/provider/moviePro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter()),
          ChangeNotifierProvider(create: (context) => Bottom()),
          ChangeNotifierProvider(create: (context) => MoviePro()),
        ],
        child: const Home(),
      ),
    );
  }
}
