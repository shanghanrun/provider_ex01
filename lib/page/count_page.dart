import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/counter.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var counterPro = Provider.of<Counter>(context);
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterPro.count.toString(),
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.add_circle, color: Colors.red),
                  onPressed: () {
                    counterPro.add();
                  },
                ),
                const SizedBox(width: 30, height: 30),
                IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.remove_circle_outline_rounded,
                      color: Colors.blue),
                  onPressed: () {
                    counterPro.minus();
                  },
                ),
                const SizedBox(width: 30, height: 30),
              ],
            ),
            const SizedBox(width: 30, height: 30),
          ],
        ),
      ),
    );
  }
}
