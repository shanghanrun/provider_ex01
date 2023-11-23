import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex01/count_page.dart';
import 'provider/counter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // var counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Sample')),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '회사'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '학교'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red,
        onTap: (index) {},
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
      //                 counter.add();
      //               },
      //             ),
      //             const SizedBox(width: 30, height: 30),
      //             IconButton(
      //               iconSize: 50,
      //               icon: const Icon(Icons.remove_circle_outline_rounded,
      //                   color: Colors.blue),
      //               onPressed: () {
      //                 counter.minus();
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
