// /*
// * NAME OF CODE ARTIFACT - ProfileMenu_page.dart
// * BRIEF DESCRIPTION - This creates the frontend settings page
// * PROGRAMMERS NAME - Parveen Kaur
// * DATE CODE CREATED - January 28 2023
// * DATE REVISED -
// * KNOWN FAULT - None
// */

import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile.dart';

import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart' as mongo;
// import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class SettingsPageUI extends StatefulWidget {
  // stateful widget
  String email; // member var
  SettingsPageUI({required this.email}); // constructor
  @override
  _SettingsPageUIState createState() => _SettingsPageUIState(
      email: '${email}'); // call another function with this constructor
}

class _SettingsPageUIState extends State<SettingsPageUI> {
  String email; // member var
  _SettingsPageUIState({required this.email}); // constructor
  @override
  Widget build(BuildContext context) {
    // build page
    return Scaffold(
        backgroundColor:
            Color.fromARGB(255, 172, 212, 245), //page background color
        appBar: AppBar(
          // title of app
          title: Text("Profile", style: TextStyle(fontSize: 22)),
          actions: <Widget>[
            IconButton(
              // button to logout
              icon: const Icon(Icons.logout),
              onPressed: () {
                // do something
                Navigator.popUntil(
                    // pop until login page
                    context,
                    ModalRoute.withName(
                        'login_page')); // takes you back to the start instead of popping it by one page

                // Navigator.pushNamed(context, 'profileMenu_page');
              },
            ),
          ],
        ),
        body: Container(
            // body of the page
            padding: const EdgeInsets.all(10), // padding
            child: ListView(
              // page view
              children: [
                SizedBox(height: 40), // size of box
                Row(
                  children: [
                    Icon(
                      //title of a part of the page with image
                      Icons.person,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text("Account", // title
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))
                  ],
                ),
                Divider(
                    height: 20,
                    thickness: 1), // a divider between title and contents
                SizedBox(height: 10),
                PersonalDetails(context, "Personal Details"), // contents
                DailyTrend(context, "Check Daily Trend"), //contents
                Reminders(context, "Set Daily Reminders"), //contents
              ],
            )));
  }

  GestureDetector PersonalDetails(BuildContext context, String title) {
    var temp;
    late final validMap;
    late final List transfer = []; //create a list
    // ignore: prefer_typing_uninitialized_variables
    // var temp;

    // get red => null;
    var finalemail;
    var password;
    var name;

    // for personal details
    return GestureDetector(
        // check movement
        onTap: () async {
          var db = await mongo.Db.create(MONGO_URL_Signup); //wait to locate url
          await db.open(); //opens the connection to url - reuquired db
          inspect(db); //ensures url exists
          var status = db.serverStatus(); //provides the status of url
          // print(status);//debug print to ensure sucessful status
          var collection = db.collection(
              COLLECTION_NAME_signup); //determine the collection of the entry
          temp = await collection
              .find(mongo.where.eq('email', '${email}'))
              .toList(); //look for specific entry
          print(temp[0]); //debug
          // print(temp["email"]); //debug

          print('check'); //debug

          final validMap = json.decode(json.encode(temp[0])) as Map<String,
              dynamic>; //map the input data to a hashmap using json
          print(validMap); //debug

          temp = validMap;

          temp.forEach((k, v) {
            finalemail = (temp['email']);
            password = (temp['password']);
            name = (temp['name']);
            // print("TestTEst");
          });

          // Text("Your details are\n");

          // String name = temp.forEach((k, v) => print("$k := $v"));

          temp.forEach((k, v) => transfer.add(
              "$k := $v\n")); //convert each map to a string and add to list
          await db.close(); //close db
          setState(() {}); //reset the page

          Navigator.of(context).push(MaterialPageRoute(
              // if tapped, go to this page
              builder: (context) => Profile_pg(
                    email: ('${finalemail}'),
                    password: ('${password}'),
                    name: ('${name}'),
                  )));
        },
        child: Padding(
          // padding
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // alignment
            Text(title, // title and text aesthetics
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            Icon(Icons.arrow_forward, color: Colors.black) // type of arrow
          ]),
        ));
  }

  GestureDetector DailyTrend(BuildContext context, String title) {
    // for graph
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
              context, 'graph_page'); // if tapped, go to next page
        },
        child: Padding(
          //padding
          padding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 20), // padding details
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //alignment
            Text(title, // title
                style: TextStyle(
                    // text style/ aesthetic
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            Icon(Icons.arrow_forward, color: Colors.black) // type of arrow
          ]),
        ));
  }

  GestureDetector Reminders(BuildContext context, String title) {
    // for reminders
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
              context, 'reminder_page'); // if tapped go to reminders page
        },
        child: Padding(
          //padding
          padding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 20), //padding details
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //alignment
            Text(title, // text and its type
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            Icon(Icons.arrow_forward, color: Colors.black) // type of arrow
          ]),
        ));
  }
}
