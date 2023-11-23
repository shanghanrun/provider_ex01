import 'package:flutter/material.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          'Count',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
