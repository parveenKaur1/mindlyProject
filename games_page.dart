import 'dart:async';

import 'package:flutter/material.dart';
import 'bird.dart';
// import 'package:testgraph/bird.dart';

class MyGamePage extends StatefulWidget {
  const MyGamePage({Key? key}) : super(key: key);

  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<MyGamePage> {
  int count = 0;
  static double birdY = 0;
  double initialPos = birdY;
  double height = 0;
  double time = 0;
  double gravity = -4.9; // how strong the gravity is
  double velocity = 3.5; // how strong the startGame is

  bool gameHasStarted = false;

  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.5; // out of 2
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6],
  ];

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // equation for the startGame using gravity
      height = gravity * time * time + velocity * time;
      setState(() {
        birdY = initialPos - height; // subtracting makes the bird go higher
      });

      // check if bird is dead
      if (birdIsDead()) {
        timer.cancel();
        gameHasStarted = false;
        _showDialog();
      }
      time += 0.01;
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdY = 0;
      gameHasStarted = false;
      time = 0;
      initialPos = birdY;
      count = 0;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                "G A M E  O V E R\nyour score was {$count}",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                  onTap: resetGame,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                          padding: EdgeInsets.all(7),
                          color: Colors.white,
                          child: Text(
                            'PLAY AGAIN',
                            style: TextStyle(color: Colors.brown),
                          ))))
            ],
          );
        });
  }

  void jump() {
    time = 0;
    count++;
  }

  bool birdIsDead() {
    if (birdY < -1 || birdY > 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: gameHasStarted ? jump : startGame,
        child: Scaffold(
            appBar: AppBar(
              //creates the app bar at the top
              title: Text('MINDLY Tapping Game'),
            ),
            body: Column(
              children: [
                Expanded(
                  flex:
                      3, // makes top container 3 times as big as the bottom container
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                        child: Stack(
                      children: [
                        MyBird(birdY: birdY),
                        Container(
                            alignment: Alignment(0, -0.5),
                            child: Text(
                              gameHasStarted ? '' : 'T A P  T O  P L A Y',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))
                      ],
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.brown,
                  ),
                )
              ],
            )));
  }
}
