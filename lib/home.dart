import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex01/count_page.dart';
import 'provider/counter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Sample')),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountPage(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                iconSize: 50,
                icon: const Icon(Icons.add_circle, color: Colors.red),
                onPressed: () {
                  counter.add();
                },
              ),
              const SizedBox(width: 30, height: 30),
              IconButton(
                iconSize: 50,
                icon: const Icon(Icons.remove_circle_outline_rounded,
                    color: Colors.blue),
                onPressed: () {
                  counter.minus();
                },
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
