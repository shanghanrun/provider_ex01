import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex01/page/count_page.dart';
import 'package:provider_ex01/page/movie_page.dart';
import 'package:provider_ex01/provider/moviePro.dart';
import 'provider/bottom.dart';
import 'provider/counter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var counterPro = Provider.of<Counter>(context, listen: false);
    var bottomPro = Provider.of<Bottom>(context);
    var moviePro = Provider.of<MoviePro>(context);
    Widget _selectedPage() {
      if (bottomPro.currentPage == 1) {
        moviePro.loadMovies();
        return const MoviePage();
      } else {
        return const CountPage();
      }
    }

    return Scaffold(
      // appBar: AppBar(title: const Text('Provider Sample')),
      body: _selectedPage(),
      // body: (bottomPro.currentPage == 1)
      //       ? MoviePage()
      //       : CountPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '회사'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '학교'),
        ],
        type: BottomNavigationBarType.fixed, // 모든 아이콘이 이동하지 않도록 고정된 타입 설정
        currentIndex: bottomPro.currentPage,
        selectedItemColor: const Color.fromARGB(255, 255, 102, 7),
        selectedFontSize: 14.0, // 선택된 라벨 폰트 사이즈
        unselectedFontSize: 12.0, // 선택되지 않은 라벨 폰트 사이즈
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold), // 선택된 라벨 폰트 스타일
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.normal), // 선택되지 않은 라벨 폰트 스타일
        unselectedItemColor: Colors.grey.withOpacity(0.7), // 여기서 투명도 조절
        onTap: (index) {
          print('$index 가 선택되었습니다.');
          bottomPro.updatePage(index);
        },
      ),
      //     const Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         CountPage(),
      //       ],
      //     ),
      //     floatingActionButton: Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             IconButton(
      //               iconSize: 50,
      //               icon: const Icon(Icons.add_circle, color: Colors.red),
      //               onPressed: () {
      //                 counterPro.add();
      //               },
      //             ),
      //             const SizedBox(width: 30, height: 30),
      //             IconButton(
      //               iconSize: 50,
      //               icon: const Icon(Icons.remove_circle_outline_rounded,
      //                   color: Colors.blue),
      //               onPressed: () {
      //                 counterPro.minus();
      //               },
      //             ),
      //             const SizedBox(width: 30, height: 30),
      //           ],
      //         ),
      //         const SizedBox(width: 30, height: 30),
      //       ],
      //     ),
    );
  }
}
