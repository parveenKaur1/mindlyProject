/*
* NAME OF CODE ARTIFACT - personal_page.dart
* BRIEF DESCRIPTION - - This creates the frontend of the application that deals with additional resources.
*                     - It displays the resources available
* PROGRAMMERS NAME - Parveen Kaur 
* DATE CODE CREATED - November 14th 2022
* DATE REVISED - November 14th 2022
* KNOWN FAULT - None
*/

import 'package:flutter/material.dart';

class MyPersonal extends StatefulWidget {
  //class for the login landing page.
  const MyPersonal({Key? key})
      : super(key: key); // constructor for log in page.

  @override
  _MyPersonalState createState() => _MyPersonalState(); //creates login page.
}

class _MyPersonalState extends State<MyPersonal> {
  //class definition.
  @override
  Widget build(BuildContext context) {
    //initializes the page to be built.
    return Container(
      // container widget. What the page is going to contain.
      child: Scaffold(
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
                    Navigator.pushNamed(context, 'game_page');
                  },
                ),
                IconButton(
                  // button
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/journal.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    //functionality
                    Navigator.pushNamed(context, 'journal_page');
                  },
                ),
                IconButton(
                  //button
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/home.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    //functionality
                    Navigator.pushNamed(context, 'home_page');
                  },
                ),
                IconButton(
                  // Icon buttom
                  // mainAxisAlignment: MainAxisAlignment.center,
                  icon: Image.asset('assets/music.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    Navigator.pushNamed(context, 'music_page');
                  }, //functionality
                ),
                IconButton(
                  tooltip: 'Open navigation menu',
                  icon: Image.asset('assets/info.png'), //image
                  iconSize: 50, //size
                  onPressed: () {
                    //functionality
                    Navigator.pushNamed(context, 'resource_page');
                  },
                ),
              ],
            )),
        appBar: AppBar(
          //app bar widget.
          title: const Text(
              "Mindly Additional Resources"), // title of the app bar.
        ),
        // defining the background.
        backgroundColor:
            Colors.blue, // background color of the page. Currently set to
        body: Stack(children: [
          // Text widget used to display count
          SingleChildScrollView(
            // allows the user to scroll down if the information can't fit in the background.
            child: Container(
              // child widget for the scroll views.
              padding: EdgeInsets.only(
                right: 35, // distance from the right
                top: 10,
                left: 35, // distance from the left
                bottom: 80, // distance from the bottom
              ), //MediaQuery.of(context).size.height *
              //0.5), //allows the upcoming text to be centered.

              child: Column(children: [
                // create a column of children
                const Text(
                  //text field
                  "Practice your breathing\n", // text
                  style: TextStyle(
                    // text style
                    color: Colors.white, // color text white
                    decoration: TextDecoration.underline, // underline text
                    fontWeight: FontWeight.bold, // bold the text
                    fontSize: 20, // set font size
                  ),
                ),
                const Text(
                  //create text field
                  "\u2022 Take 5 deep breaths\nBreathe in, hold for 5 seconds and slowly breathe out\n", // text
                  style: TextStyle(
                    //style
                    color: Colors.white, //white font
                    fontSize: 20, //font size
                  ),
                ),
                const Text(
                  //text field
                  "Play our tapping game\n", //text
                  style: TextStyle(
                    //style
                    color: Colors.white, //white font
                    decoration: TextDecoration.underline, //create an underline
                    fontWeight: FontWeight.bold, //bold the font
                    fontSize: 20, // font size
                  ),
                ),
                Positioned(
                    //position of button
                    bottom: 10, // distance from bottom
                    left: 102, //distance from left
                    child: IconButton(
                      //child clickable button
                      // mainAxisAlignment: MainAxisAlignment.center,
                      icon: Image.asset('assets/game.png'), //image
                      iconSize: 50, //size
                      onPressed: () {
                        //press functionality
                        Navigator.pushNamed(context, 'game_page'); //redirection
                      },
                    )),
                const Text(
                  //text
                  "Get active\n", //text
                  style: TextStyle(
                    //style
                    color: Colors.white, //white font
                    decoration: TextDecoration.underline, //underline text
                    fontWeight: FontWeight.bold, //bold text
                    fontSize: 20, //font size
                  ),
                ),
                const Text(
                  //text
                  "\u2022Take a trip to the Recreation Centre located on campus\n\u2022Go for a bike ride\n\u2022Go for a 40 minute brisk walk to absord some sun\n\u2022Enroll into a dance class",
                  style: TextStyle(
                    //style
                    color: Colors.white, //white font
                    fontSize: 20, //font size
                  ),
                ),
                const Text(
                  //text
                  "\n3-3-3 Rule", //text
                  style: TextStyle(
                    //style
                    color: Colors.white, //white
                    decoration: TextDecoration.underline, //underline font
                    fontWeight: FontWeight.bold, //bold font
                    fontSize: 20, //font size
                  ),
                ),
                // https://adultmentalhealth.org/managing-and-reducing-anxiety/
                const Text(
                  //text
                  "\u2022Look around you and name three things you see\n\u2022Then, name three sounds you hear\n\u2022Finally, move three parts of your body (eg, ankle, fingers or arm)\n",
                  style: TextStyle(
                    //style
                    color: Colors.white, //font color
                    fontSize: 20, //font size
                  ),
                ),
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
