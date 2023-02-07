import 'package:flutter/material.dart';

/*This is the journaling page the user fills to record their entries.
# NAME OF CODE ARTIFACT - Journal_page.dart 
# BRIEF DESCRIPTION - This is the journal page entry for the Mindly app.
# PROGRAMMERS NAME - Eduardo Sanchez
# DATE CODE CREATED - October 19, 2022
# DATE REVISED - October 20 2022
#                   Eduardo Sanchez - added save button, no functionality at this point.
#       
#                   Jowaki Merani   - changed color of the text box to white instead of the same as the background.
#                                   - increased the size of the text box.
#                 November 4th 
#                   Jowaki Merani - conected the save button to send teh text to the db 
#
# 
*/
import 'dart:developer';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
// import 'package:mongo_dart/mongo_dart.dart';

class MyTest extends StatefulWidget {
  // class for the journal page.

  const MyTest({Key? key})
      : super(key: key); //constructor for the journal page.

  @override
  _MyTestState createState() => _MyTestState(); //creates journal page.
}

class _MyTestState extends State<MyTest> {
  //defines the journal page.
  String g_journal = "";
  @override
  Widget build(BuildContext context) {
    // builds the widget.
    const appTitle =
        'TESTTEST'; // this sets the title of the page. set to 'Mindly' for all pages as of 10/03.
    return MaterialApp(
      // what the page will contain. returns the content below.
      debugShowCheckedModeBanner:
          false, // disables debug banner when troubleshooting.
      title: appTitle, // title is set to 'Mindly'.
      home: Scaffold(
        // home page is set.
        appBar: AppBar(
          //app bar widget.
          title: const Text(appTitle), // title of the app bar.
        ),
        backgroundColor: Colors.blue, // background color of the main page
        body: Center(
            // the body of the page, this contains the text field.
            child: Column(
          mainAxisAlignment: MainAxisAlignment
              .start, // centers the box and places it on top section. might change to center.
          children: [
            // contains the children for text box.
            TextFormField(
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType
                  .multiline, // allows how many lines of text are shown before scroll function is set
              textAlign: TextAlign
                  .start, // where to begin the text once the user inputs their entry.
              decoration: InputDecoration(
                  hintText:
                      'Journal Entry here', // ghost text to show where to input entry, disapears once input is recieved.
                  fillColor:
                      Colors.grey.shade100, // color of the text box background.
                  filled:
                      true, // fills the text box background to the above color.
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 100,
                      horizontal:
                          50), // sets the size of the journal entry text box.
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(50)) // outlines the text box.
                      )),
              onChanged: (jor) {
                g_journal = jor;
              },
            ),
            Container(
              // container widget for the save button.
              height: 50, //height of the save button.
              width: 150, //width of the save button.
              child: ElevatedButton(
                onPressed: () async {
                  // String textToSendBack = textFieldController.text;

                  // Navigator.pop(context, events); //send event back to screen

                  // Navigator.popUntil(context, (route) => false);

                  // Navigator.pushNamed(context, 'home_page');//send to db
                },
                child: Text('Save'),
              ),
            ),
            Row(
              children: [
                Positioned(
                    // position of button
                    bottom: 10, // distance from bottom
                    left: 2, // distance from top
                    child: IconButton(
                      // Icon buttom
                      // mainAxisAlignment: MainAxisAlignment.center,
                      icon: Image.asset('assets/music.png'), //image
                      iconSize: 50, //size
                      onPressed: () {}, //functionality
                    )),
                Positioned(
                    // position of button
                    bottom: 10, // distance from bottom
                    left: 52, // distance from left
                    child: IconButton(
                      // button
                      // mainAxisAlignment: MainAxisAlignment.center,
                      icon: Image.asset('assets/journal.png'), //image
                      iconSize: 50, //size
                      onPressed: () {
                        //functionality
                        Navigator.pushNamed(context, 'journal_page');
                      },
                    )),
                Positioned(
                    //position of button
                    bottom: 10, //distance from bottom
                    left: 102, //distance from left
                    child: IconButton(
                      // button
                      // mainAxisAlignment: MainAxisAlignment.center,
                      icon: Image.asset('assets/game.png'), //image
                      iconSize: 50, //size
                      onPressed: () {
                        //functionality
                        Navigator.pushNamed(context, 'game_page');
                      },
                    )),
                Positioned(
                    //position of button
                    bottom: 10, //distance from bottom
                    left: 152, //distance from left
                    child: IconButton(
                      //button
                      // mainAxisAlignment: MainAxisAlignment.center,
                      icon: Image.asset('assets/home.png'), //image
                      iconSize: 50, //size
                      onPressed: () {
                        //functionality
                        Navigator.pushNamed(context, 'home_page');
                      },
                    )),
                Positioned(
                    //position of button
                    bottom: 10, // distance from bottom
                    left: 202, //distance from left
                    child: IconButton(
                      //button
                      // mainAxisAlignment: MainAxisAlignment.center,
                      icon: Image.asset('assets/info.png'), //image
                      iconSize: 50, //size
                      onPressed: () {
                        //functionality
                        Navigator.pushNamed(context, 'resource_page');
                      },
                    )),
              ],
            ),
          ], // The style of the button and the text in the button.
        )),
      ),
    );
  }
}
