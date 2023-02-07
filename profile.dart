/*
* NAME OF CODE ARTIFACT - profile.dart
* BRIEF DESCRIPTION - This is the page that retreves data from the db 
* PROGRAMMERS NAME - Jowaki Merani
* DATE CODE CREATED - Nov 19th, 2022
* DATE REVISED - Nov 19th  
                 Jowaki Merani - abe to retreve data and print to terminal 
*               Jan 28th 
                Jowaki Merani - reformatted the data to provide a better UI
KNOWN FAULT - None
*/
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
// import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class Profile_pg extends StatefulWidget {
  String email;
  String password;
  String name;
  Profile_pg({required this.email, required this.password, required this.name});

  @override
  _Profile_pgState createState() => _Profile_pgState(
      email: '$email', password: '${password}', name: '${name}');
}

class _Profile_pgState extends State<Profile_pg> {
  // MaterialColor backgroundColor;
  String email;
  String password;
  String name;
  _Profile_pgState(
      {required this.email, required this.password, required this.name});

  get static => null;
  var temp;
  late final validMap;
  late final List transfer = []; //create a list
  // ignore: prefer_typing_uninitialized_variables
  // var temp;

  // get red => null;
  // var finalemail;
  // var password;
  // var name;
  @override
  Widget build(BuildContext context) {
    print('object ${email}');
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        // what the page will contain. returns the content below.
        home: Scaffold(

            // home page is set.
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
              title: Text('MINDLY'),

              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                    Navigator.pushNamed(context, 'updateInfo_page');
                  },
                ),
              ],
            ),
            backgroundColor: Colors.blue, // background color of the main page
            body: Stack(children: [
              Container(
                  // the body of the page, this contains the text field.
                  height: 1700, //height of the save button.
                  width: 100,
                  child: Container(
                    // container widget for the save button.
                    height: 10, //height of the save button.
                    width: 0, //width of the save button.

                    // right: 70,
                    // bottom: 100,
                  )),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        //determine text style
                        color: Colors.white,
                        // decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: IconButton(
                              iconSize: 30,
                              onPressed: () {},
                              icon: Icon(Icons.person, color: Colors.white),
                            ),
                          ),
                        ),
                        TextSpan(text: 'Name: ${name}'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        //determine text style
                        color: Colors.white,
                        // decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: IconButton(
                              iconSize: 30,
                              onPressed: () {},
                              icon: Icon(Icons.mail, color: Colors.white),
                            ),
                          ),
                        ),
                        TextSpan(text: 'Email: ${email}'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        //determine text style
                        color: Colors.white,
                        // decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: IconButton(
                              iconSize: 30,
                              onPressed: () {},
                              icon: Icon(Icons.key, color: Colors.white),
                            ),
                          ),
                        ),
                        TextSpan(text: 'Password: ${password}'),
                      ],
                    ),
                  ),
                ],
              )
            ])));
  }
}
