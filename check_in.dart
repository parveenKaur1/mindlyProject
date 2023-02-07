/*
* NAME OF CODE ARTIFACT - check_in.dart
* BRIEF DESCRIPTION - This creates the frontend of the application that deals with the check in
*                     users are asked questions about how they are feeling to track their day-to-day mental health
*                     
* PROGRAMMERS NAME - Parveen Kaur
* DATE CODE CREATED - November 13th 2022
* DATE REVISED - November 20th 2022
              - January 23rd 2023 - added a feature so that when scrolling, text does not overlap
* KNOWN FAULTS - None
*/

import 'package:flutter/material.dart';
import 'package:flutter_application_1/DemoApp.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class MyCheckIn extends StatelessWidget {
  //class for the login landing page.
  String email;
  MyCheckIn({required this.email});
  String g_feeling = ""; // global variable
  String g_worry = ""; // global variable
  String g_happy = ""; // global variable
  String g_sociliazing = ""; // global variable
  String g_corner = ""; // global variable
  //class definition.
  @override
  Widget build(BuildContext context) {
    //initializes the page to be built.
    return Container(
      // container widget. What the page is going to contain.
      child: Scaffold(
        appBar: AppBar(
          //app bar widget.
          title: const Text("Mindly Daily Check-in"), // title of the app bar.
        ),
        // defining the background.
        backgroundColor:
            Colors.blue, // background color of the page. Currently set to
        body: Stack(children: [
          // defining the body of the display.

          SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: IntrinsicHeight(
                child: Column(
              children: <Widget>[
                Expanded(
                  // A flexible child that will grow to fit the viewport but
                  // still be at least as big as necessary to fit its contents.
                  child: Container(
                    color: Color(0xFF0097EE), // Red
                    height: 1000.0,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Text(
                          // text
                          'How Am I feeling today?',
                          textAlign: TextAlign
                              .left, // how we want the text to be displayed
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        TextField(
                          //creates textField widget
                          decoration: InputDecoration(
                            // the text box to be filled
                            fillColor:
                                Colors.grey.shade100, //  color is set to white.
                            filled:
                                true, // sets the entire box to be filled to the color above.
                            border: OutlineInputBorder(
                              //outline border widget.
                              borderRadius: BorderRadius.circular(
                                  10), // size of the border set to 10.
                            ),
                          ),
                          onChanged: (feeling) => (g_feeling =
                              feeling), // store value in global variable
                        ),
                        const SizedBox(
                          // setting size of the next text box.
                          height: 30, // height is set to 30.
                        ),
                        const Text(
                          //text
                          'What has been worrying me lately?',
                          style: TextStyle(
                              color: Colors.white, fontSize: 27), //style
                        ),
                        TextField(
                          //creates textField widget
                          decoration: InputDecoration(
                            // the text box to be filled
                            fillColor:
                                Colors.grey.shade100, //  color is set to white.
                            filled:
                                true, // sets the entire box to be filled to the color above.
                            border: OutlineInputBorder(
                              //outline border widget.
                              borderRadius: BorderRadius.circular(
                                  10), // size of the border set to 10.
                            ),
                          ),
                          onChanged: (worry) => (g_worry =
                              worry), // store value in global variable
                        ),
                        const SizedBox(
                          // setting size of the next text box.
                          height: 30, // height is set to 30.
                        ),
                        const Text(
                          //text
                          'What happened today that made me really happy?',
                          style: TextStyle(
                              color: Colors.white, fontSize: 27), //style
                        ),
                        TextField(
                          //creates textField widget
                          decoration: InputDecoration(
                            // the text box to be filled
                            fillColor:
                                Colors.grey.shade100, //  color is set to white.
                            filled:
                                true, // sets the entire box to be filled to the color above.
                            border: OutlineInputBorder(
                              //outline border widget.
                              borderRadius: BorderRadius.circular(
                                  10), // size of the border set to 10.
                            ),
                          ),
                          onChanged: (happy) => (g_happy =
                              happy), // store value in global variable
                        ),
                        const SizedBox(
                          // setting size of the next text box.
                          height: 30, // height is set to 30.
                        ),
                        const Text(
                          //text
                          'Have I been socializing less?',
                          style: TextStyle(
                              color: Colors.white, fontSize: 27), //style
                        ),
                        TextField(
                          // textfield widget.
                          decoration: InputDecoration(
                            //decoration widget
                            fillColor: Colors.grey
                                .shade100, // fills the box to the color set.
                            filled:
                                true, // fills the entire box with the above color.
                            border: OutlineInputBorder(
                              // outline border widget.
                              borderRadius: BorderRadius.circular(
                                  10), //borders the text box with size 10.
                            ),
                          ),
                          onChanged: (socializing) => (g_sociliazing =
                              socializing), // store value in global variable
                        ),
                        const SizedBox(
                          //size box widget enabled.
                          height: 40, // set the size to 40.
                        ),
                        const Text(
                          //text
                          'Who do I have in my corner?',
                          style: TextStyle(
                              color: Colors.white, fontSize: 27), //style
                        ),
                        TextField(
                          //creates textField widget
                          decoration: InputDecoration(
                            // the text box to be filled
                            fillColor:
                                Colors.grey.shade100, //  color is set to white.
                            filled:
                                true, // sets the entire box to be filled to the color above.
                            border: OutlineInputBorder(
                              //outline border widget.
                              borderRadius: BorderRadius.circular(
                                  10), // size of the border set to 10.
                            ),
                          ),
                          onChanged: (corner) {
                            g_corner = corner; // store value in global variable
                          },
                        ),
                        const SizedBox(
                          // setting size of the next text box.
                          height: 30, // height is set to 30.
                        ),
                        Row(
                          //row widget
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, //divides the space between the children evenly.
                          children: [
                            // sets the children in the row.
                            const Text(
                              // text widget.
                              'Homepage', // displays 'Sign In' screen.
                              style: TextStyle(
                                  // text style widget.
                                  color: Colors
                                      .white, //color of the string set to white.
                                  fontSize: 27, // font size set the 27.
                                  fontWeight: FontWeight
                                      .w700), // How "bold" the string appears.
                            ),

                            CircleAvatar(
                              // circle display
                              radius: 30, //radius of the circle.
                              backgroundColor: Colors
                                  .lightBlueAccent, // set the color for the button.
                              child: IconButton(
                                //the icon inside the button
                                color: Colors.white, // icon color set to white.
                                onPressed: () async {
                                  //when button is pressed connect to database
                                  var db =
                                      await mongo.Db.create(MONGO_URL_CHECKIN);
                                  await db.open(); //wait for it to open
                                  var userCollection = // connect to the specific table
                                      db.collection(COLLECTION_NAME_checkin);
                                  await userCollection.insert({
                                    //insert global values into the respective fields
                                    "feeling ": g_feeling,
                                    "worry": g_worry,
                                    "happy": g_happy,
                                    "socializing": g_sociliazing,
                                    "corner": g_corner,
                                  });
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DemoApp(
                                            email: ('${email}'),
                                          )));
                                  // Navigator.pushNamed(context,
                                  //     'home_page'); // upon pushed, redirect
                                  //make database connection
                                }, // allows user to click the button. Nothing happens right now.
                                icon: const Icon(Icons
                                    .arrow_forward), // icon inside the button is an arrow.
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          //size box widget.
                          height: 40, //size set to 40.
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          )),
        ]),
      ),
    );
  }
  // const MyCheckIn({Key? key}) : super(key: key); // constructor for log in page.

  // @override
  // _MyCheckInState createState() => _MyCheckInState(); //creates login page.
}

// class _MyCheckInState extends State<MyCheckIn> {
 

