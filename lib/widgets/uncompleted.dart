import 'package:flutter/material.dart';

class Uncompleted extends StatelessWidget {
  const Uncompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.edit,
            size: 55,
          ),
          SizedBox(height: 18),
          Text(
            'No order found',
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ));
  }
}
