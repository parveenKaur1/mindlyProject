/*
* NAME OF CODE ARTIFACT - main.dart
* BRIEF DESCRIPTION - This is the main page that opens at the begining 
* PROGRAMMERS NAME - Eduardo Sanchez
* DATE CODE CREATED - October 1st, 2022
* DATE REVISED - October 1st
*                Eduardo Sanchez - Generated a main page with the opening options of either loging in or signing up 
                 October 7th
                 Eduardo Sanchez - linked the main page buttons to corresponding pages
                 October 23rd 
                 Jowaki Merani - reformat the code to work for database connections
* KNOWN FAULT - None
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/forgotPass_page.dart';
import 'package:flutter_application_1/games_page.dart';
import 'package:flutter_application_1/graph_page.dart';
import 'package:flutter_application_1/quiz_screen.dart';
import 'package:flutter_application_1/reminder_page.dart';
import 'package:flutter_application_1/personal_page.dart';
import 'package:flutter_application_1/play.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/profileMenu_page.dart';
import 'package:flutter_application_1/resourcepage.dart';
import 'package:flutter_application_1/test_page.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'journal_page.dart';
import 'DemoApp.dart';
import 'check_in.dart';
import 'music_page.dart';
import 'play.dart';
import 'reminder_page.dart';
import 'graph_page.dart';
import 'profileMenu_page.dart';
import 'games_page.dart';
import 'quiz_screen.dart';
import 'question_model.dart';
// import 'profileMenu_page.dart';
// import 'mongodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: await_only_futures
  // await MongoDbDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //creates an app class
  const MyApp({super.key}); //app class has a const return key

  @override
  Widget build(BuildContext context) {
    //calls the build function - inbuilt
    return MaterialApp(
        debugShowCheckedModeBanner:
            false, // this disables a banner shown on the top left corner of the emulator.
        initialRoute:
            'login_page', // sets the first page when starting up the project. set to login page.
        routes: {
          // route shows the available pages the app is able tot traverse to.
          'login_page': (context) =>
              const MyLogin(), // login page available to traverse to
          'sign_up_page': (context) =>
              const MyRegister(), // sign up page available to traverse
          'journal_page': (context) =>
              const MyJournal(), // Journal page available to traverse.
          'home_page': (context) => DemoApp(
                email: '',
              ),
          'checkin_page': (context) => MyCheckIn(
                email: '',
              ), //TODO
          "resource_page": (context) => const MyResource(),
          "personal_page": (context) => const MyPersonal(),
          "profile_page": (context) => Profile_pg(
                email: '',
                name: '',
                password: '',
              ),
          "music_page": (context) => const MyMusic(),
          "play_page": (context) => const MyPlay(),
          "test_page": (context) => const MyTest(),
          "forgotPass_page": (context) => const MyForgotPass(),
          "reminder_page": (context) => const MyNoteScreen(),
          "graph_page": (context) => const MyGraph(),
          "tap_game": (context) => const MyGamePage(),
          "quiz_page": (context) => QuizScreen(
                email: '',
              ),

          "profileMenu_page": (context) => SettingsPageUI(
                email: '',
              ),
        });
  }
}
