import 'package:flutter/material.dart';
import 'package:provider_ex01/count_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Sample')),
      body: const CountPage(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle, size: 50, color: Colors.red),
                onPressed: () {},
              ),
              const SizedBox(width: 30, height: 30),
              IconButton(
                icon: const Icon(Icons.remove_circle_outline_rounded,
                    size: 50, color: Colors.blue),
                onPressed: () {},
              ),
              const SizedBox(width: 30, height: 30),
            ],
          ),
          const SizedBox(width: 30, height: 30),
        ],
      ),
    );
  }
}
