import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  final birdY;
  MyBird({this.birdY});

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdY),
      child: Image.asset(
        'assets/corgi.png',
        width: 50,
      ),
    );
  }
}
