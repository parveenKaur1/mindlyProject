/*
* NAME OF CODE ARTIFACT - resourcepage.dart
* BRIEF DESCRIPTION - This creates the frontend of the application that deals with resources.
*                     - It displays the resources available
* PROGRAMMERS NAME - Parveen Kaur 
* DATE CODE CREATED - November 14th 2022
* DATE REVISED - November 14th 2022
* KNOWN FAULT - None
*/

import 'package:flutter/material.dart';

class MyResource extends StatefulWidget {
  //class for the login landing page.
  const MyResource({Key? key})
      : super(key: key); // constructor for log in page.

  @override
  _MyResourceState createState() => _MyResourceState(); //creates login page.
}

class _MyResourceState extends State<MyResource> {
  String appTitle = "Mindly";

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
          title: Text(appTitle), // title of the app bar.
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/pointy.png'), //image
              onPressed: () {
                // do something
                Navigator.pushNamed(context, 'personal_page');
              },
            ),
          ],
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
                right: 35,
                left: 35,
                bottom: 80,
              ), //MediaQuery.of(context).size.height *
              //0.5), //allows the upcoming text to be centered.

              child: Column(children: [
                const Text(
                  //text
                  "\nCounseling And Psychological Services, KU", //text
                  style: TextStyle(
                    //style
                    color: Colors.white, //white
                    decoration: TextDecoration.underline, //underline text
                    fontWeight: FontWeight.bold, //bold text
                    fontSize: 20, //font size
                  ),
                ),
                const Text(
                  //text
                  "Website: https://caps.ku.edu/\nContact Number: 785-864-2277\n", //text
                  style: TextStyle(
                    //text style
                    color: Colors.white, //font = white
                    fontSize: 20, // font size
                  ),
                ),
                Image.asset(
                  // image
                  'assets/qr.png',
                ),
                const Text(
                  //text
                  "CAPS- 24/7 Support, KU", //text
                  style: TextStyle(
                    //text style
                    color: Colors.white, // white
                    fontWeight: FontWeight.bold, //bold text
                    decoration: TextDecoration.underline, //underline text
                    fontSize: 20, // font size
                  ),
                ),
                const Text(
                  //text
                  "Telephone Support: 1.866.408.2828\nDownload MY SSP to Call. Chat. Anytime. Anywhere\n", //text
                  style: TextStyle(
                    //text style
                    color: Colors.white, //font color
                    fontSize: 20, //font size
                  ),
                ),
                const Text(
                  //text
                  "Suicide Prevention Helpline", //text
                  style: TextStyle(
                    //text style
                    color: Colors.white, // text color
                    fontWeight: FontWeight.bold, //bold text
                    decoration: TextDecoration.underline, //underline text
                    fontSize: 20, // text size
                  ),
                ),
                const Text(
                  //text
                  "Dial: 988\n", //text
                  style: TextStyle(
                    //text style
                    color: Colors.white, // text color
                    fontSize: 20, // text size
                  ),
                ),
                const Text(
                  // text
                  "Emergency Services:", //text
                  style: TextStyle(
                    // text style
                    color: Colors.white, // text color
                    fontWeight: FontWeight.bold, //bold text
                    decoration: TextDecoration.underline, // underline text
                    fontSize: 20, // text size
                  ),
                ),
                const Text(
                  // text
                  "Dial: 999\n", // text
                  style: TextStyle(
                    // text style
                    color: Colors.white, // color
                    fontSize: 20, // size
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
