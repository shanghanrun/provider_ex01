import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'countProvider.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    return Center(
      child: Container(
        child: Text(
          'Count : ${counter.count}',
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
