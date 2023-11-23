import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/counter.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var counter = Provider.of<Counter>(context);
    return Center(
      child: Container(
        child: Consumer<Counter>(builder: (context, provider, child) {
          return Text(
            provider.count.toString(),
            style: const TextStyle(
              fontSize: 50,
            ),
          );
        }),
      ),
    );
  }
}
