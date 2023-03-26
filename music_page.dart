/*
* NAME OF CODE ARTIFACT - music_page.dart
* BRIEF DESCRIPTION - - This creates the frontend of the music page
* PROGRAMMERS NAME - Parveen Kaur 
* DATE CODE CREATED - November 30th 2022
* DATE REVISED - March 9th
                 Parveen Kaur - added proper navigation between pages
               - March 26th
                 Jui Nagarkar - added navigator path for the music files  
* KNOWN FAULT - None
*/

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_1/music/play_music.dart';
import 'package:flutter_application_1/resources/ResourcePg.dart';

import '../DemoApp.dart';
//import '../animal/animal.dart';
import '../games/games_meanu_pg.dart';
import '../journal_page.dart';

class MyMusic extends StatefulWidget {
  //class for the login landing page.
  String email = "";
  MyMusic({required this.email}); // constructor for log in page.

  @override
  _MyMusicState createState() =>
      _MyMusicState(email: "$email"); //creates login page.
}

class _MyMusicState extends State<MyMusic> {
  String email;
  _MyMusicState({required this.email});
  Widget build(BuildContext context) {
    String appTitle = "Mindly Music Page";
    return Container(
      // container widget. What the page is going to contain.

      child: Scaffold(
        //bottombar for navigation of pages
        bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                IconButton(
                  // button
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/game.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    //functionality
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyGame_Meanu(
                              email: ('${email}'),
                            )));
                  },
                ),
                IconButton(
                  // button
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/journal.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    //functionality
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyJournal(
                              email: ('${email}'),
                            )));
                  },
                ),
                IconButton(
                  //button
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/home.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    // if tapped, go to this page
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DemoApp(
                              email: ('$email'),
                            )));
                    //functionality
                    // Navigator.pushNamed(context, 'home_page');
                  },
                ),
                IconButton(
                  // Icon buttom
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/music.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        // if tapped, go to this page
                        builder: (context) => MyMusic(
                              email: ('$email'),
                            )));
                  }, //functionality
                ),
                IconButton(
                  tooltip: 'Open navigation menu',
                  icon: Image.asset('assets/info.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        // if tapped, go to this page
                        builder: (context) => Resources(
                              email: ('$email'),
                            )));
                    //functionality
                  },
                ),
                IconButton(
                  // Icon buttom
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/animal.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     // if tapped, go to this page
                    //     builder: (context) => MyAnimal(
                    //           email: ('$email'),
                    //         )));
                  }, //functionality
                ),
              ],
            )),
        appBar: AppBar(
          //app bar widget.
          title: Text(appTitle), // title of the app bar.
        ),
        // defining the background.
        backgroundColor:
            Colors.blue, // background color of the page. Currently set to
        body: Stack(children: [
          const Text(
            // creates a textfield
            "\n", //text
            style: TextStyle(
              // the style for the text
              color: Colors.white, // color it white
              fontSize: 33, // font size
            ),
          ),
          SingleChildScrollView(
            // allows the user to scroll down if the information can't fit in the background.

            child: Container(
              // child widget for the scroll views.
              padding: const EdgeInsets.only(
                right: 35, // distance from the right
                top: 20,
                left: 35, // distance from the left
                bottom: 180, // distance from the bottom
              ), //MediaQuery.of(context).size.height *
              //0.5), //allows the upcoming text to be centered.

              child: Column(children: [
                ElevatedButton.icon(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/play.png'), //image
                  onPressed: () async {
                    //this is the navigator method for playing song 1
                    Navigator.of(context).push(MaterialPageRoute(
                        //     // if tapped, go to this page
                        builder: (context) => PlayMusic(
                              songNumber: 1,
                            )));

                    // final player = AudioCache();
                    // player.play('testAudio.mp3');
                  },
                  label: const Text("Tune 1: Meditation"), //button label
                ),
                const Text("\n"),
                ElevatedButton.icon(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/play.png'), //image
                  onPressed: () {
                    //this is the navigator method for playing song 2
                    Navigator.of(context).push(MaterialPageRoute(
                        //     // if tapped, go to this page
                        builder: (context) => PlayMusic(
                              songNumber: 2,
                            )));
                    //Navigator.pushNamed(context, 'play_page');
                    //functionality
                  },
                  label: const Text("Tune 2: Soothing"), //button label
                ),
                const Text("\n"),
                ElevatedButton.icon(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/play.png'), //image
                  onPressed: () {
                    //functionality
                    //Navigator.pushNamed(context, 'play_page');
                    //this is the navigator method for playing song 3
                    Navigator.of(context).push(MaterialPageRoute(
                        //     // if tapped, go to this page
                        builder: (context) => PlayMusic(
                              songNumber: 3,
                            )));
                  },
                  label: const Text("Tune 3: Upbeat"), //button label
                ),
                const Text("\n"),
                Row(
                    //row widget.

                    ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
