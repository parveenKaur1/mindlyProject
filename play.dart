/*
* NAME OF CODE ARTIFACT - play.dart
* BRIEF DESCRIPTION - - This creates the frontend for each song
* PROGRAMMERS NAME - Parveen Kaur 
* DATE CODE CREATED - December 4th 2022
* DATE REVISED - December 4th 2022
* KNOWN FAULT - None
*/
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyPlay extends StatefulWidget {
  //class for the login landing page.
  const MyPlay({Key? key}) : super(key: key); // constructor for log in page.

  @override
  _MyPlayState createState() => _MyPlayState(); //creates login page.
}

class _MyPlayState extends State<MyPlay> {
  final audioPlayer = AudioPlayer(); // audioplayer
  bool isPlaying = false; //default
  Duration duration = Duration.zero; //default
  Duration position = Duration.zero; //default

  @override
  void iniState() {
    //initializing variables
    super.initState(); //initialize the state
    setAudio(); //call the setAudio function
    audioPlayer.onPlayerStateChanged.listen((state) {
      // listen to state changes
      setState(() {
        //set to true if it is playing
        isPlaying = state == PlayerState.PLAYING;
      });
      audioPlayer.onDurationChanged.listen((newDuration) {
        // set new duration as the song continues
        setState(() {
          duration = newDuration; //set it
        });
        audioPlayer.onAudioPositionChanged.listen((newPosition) {
          //wait to see if audio position is changing
          setState(() {
            position =
                newPosition; //constantly replace old position with new postion
          });
        });
      });
    });
  }

  Future setAudio() async {
    //set audio
    audioPlayer.setReleaseMode(ReleaseMode.LOOP); //loop if song has ended//

    final player = AudioCache(prefix: 'assets/'); //path to get audio
    final url = await player.load('testAudio.mp3'); //audio in audio folder
    audioPlayer.setUrl(url.path, isLocal: true); //set the url
  }

  String formatTime(Duration duration) {
    // get the correct time remaining
    String twoDigits(int n) => n.toString().padLeft(2, '0'); //kind of time
    final hours = twoDigits(duration.inHours); //hours
    final minutes = twoDigits(duration.inMinutes.remainder(60)); //minutes
    final seconds = twoDigits(duration.inSeconds.remainder(60)); //seconds
    return [
      if (duration.inHours > 0) hours, // as long as the time is not completed
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        //app bar widget.
        title: Text("Mindly"), // title of the app bar.
      ),
      // build
      body: Padding(
          //padding for page
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //center everything
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(20), //image has circular ends
                child: Image.network(
                  //image url
                  "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
                  width: double.infinity, //fill up space
                  height: 350, // height of image
                  fit: BoxFit.cover, // fit image to box
                ),
              ),
              const SizedBox(height: 32), //box size
              const Text(
                //text under box
                'Song',
                style: TextStyle(
                  //text style
                  fontSize: 24, //font size
                  fontWeight: FontWeight.bold, //bold the song name
                ),
              ),
              const SizedBox(height: 4), // box for under song name
              const Text(
                // text in box
                'Sarah',
                style: TextStyle(fontSize: 20), // font size
              ),
              Slider(
                  //slider for time
                  min: 0, //default min = 0
                  max: duration.inSeconds.toDouble(), // maximum
                  value: position.inSeconds.toDouble(), //value
                  onChanged: (value) async {
                    // as value changes, change value on slider
                    final position =
                        Duration(seconds: value.toInt()); // conversion
                    await audioPlayer.seek(position); //wait for pos
                    await audioPlayer.resume(); //continue
                  }),
              Padding(
                //padding
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //center
                  children: [
                    Text(formatTime(
                        position)), //format the time in current position
                    Text(formatTime(
                        duration - position)), // format the remaining time
                  ],
                ),
              ),
              CircleAvatar(
                //play button
                radius: 35, // size
                child: IconButton(
                  icon: Icon(
                    isPlaying
                        ? Icons.pause
                        : Icons.play_arrow, // the typeof button
                  ),
                  iconSize: 50, //size of icon
                  onPressed: () async {
                    //if pressed do this
                    if (isPlaying) {
                      // if playing, pause it
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume(); //otherwise resume
                    }
                  },
                ),
              ),
              Positioned(
                  // position of button
                  bottom: 10, // distance from bottom
                  left: 2, // distance from top
                  child: IconButton(
                    // Icon buttom
                    // mainAxisAlignment: MainAxisAlignment.center,
                    icon: Image.asset('assets/arrow.png'), //image
                    iconSize: 50, //size
                    onPressed: () {
                      Navigator.pushNamed(context, 'music_page');
                    }, //functionality
                  )),
            ],
          )));
}
