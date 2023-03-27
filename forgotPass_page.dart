/*
* NAME OF CODE ARTIFACT - forgotPass_page.dart
* BRIEF DESCRIPTION - This creates the frontend of the application that deals with forgot password
                    Users are asked to key in their email for verification
* PROGRAMMERS NAME - Parveen Kaur, Eduardo Sanchez
* DATE CODE CREATED - January 28th 2023
* DATE REVISED - March 26 20023
* known issue - line 138, arguement where "app" is located.
*/

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:realm/realm.dart'; // added realm sdk for reset password.

class MyForgotPass extends StatefulWidget {
  //class for the login landing page.
  const MyForgotPass({Key? key})
      : super(key: key); // constructor for log in page.

  @override
  _MyForgotPassState createState() =>
      _MyForgotPassState(); //creates login page.
}

class _MyForgotPassState extends State<MyForgotPass> {
  //class definition.
  final _emailcontroller = TextEditingController(); // classifies the variable as a text editing controller and allows access to methods for retrieving information.

  @override
  Widget build(BuildContext context) {
    //initializes the page to be built.
    return Container(
      // container widget. What the page is going to contain.
      child: Scaffold(
        // defining the background.
        backgroundColor:
            Colors.blue, // background color of the page. Currently set to
        body: Stack(children: [
          // defining the body of the display.
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80), // edge insets
            child: const Text(
              //text widget allows to customize "Mindly" string.
              "Mindly\nForgot Password",
              style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      33), //string "Mindly" set in white and font size 33.
            ),
          ),
          SingleChildScrollView(
            // allows the user to scroll down if the information can't fit in the background.
            child: Container(
              // child widget for the scroll views.
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height *
                      0.3), //allows the upcoming text to be centered.

              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "Please enter your email for verification:\n",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  TextField(
                    controller: _emailcontroller, // variable to get the string from the user input.
                    // textfield widget.
                    textAlign: TextAlign.center,
                    obscureText: false, //obscure text to hide the users input.
                    decoration: InputDecoration(
                      //decoration widget
                      fillColor: Colors
                          .grey.shade100, // fills the box to the color set.
                      filled:
                          true, // fills the entire box with the above color.
                      hintText:
                          'Email', // string 'Password' is displayed when the box is idle.
                      border: OutlineInputBorder(
                        // outline border widget.
                        borderRadius: BorderRadius.circular(
                            10), //borders the text box with size 10.
                      ),
                    ),
                  ),
                  // Align(
                  //     alignment: Alignment.centerRight,
                  //     child: Icon(Icons.arrow_forward)),
                  IconButton(
                    icon: Icon(Icons.arrow_forward), // arrow
                    onPressed: () => {
                      // when pressed show a dialog
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                // dialog type is an alert
                                title: Text(
                                    "Reset Password"), // reset pass is the title
                                content: Text(
                                    // content within the dialog is as stated
                                    "Dear user, provided the email you have keyed in is correct, you have been sent an email regarding the steps you can take to reset your password."),
                              )),
                      sendEmail(), // call send email function
                    },
                    alignment: Alignment.topCenter,
                  )
                ],
              ),
            ),
          ),

          IconButton(
            // button
            icon: Icon(Icons.arrow_back), //use flutter arrow
            onPressed: () => {
              Navigator.pop(
                  context) //move one screen back// pop back a screen once clicked
            },
            alignment: Alignment.topCenter, //align it to top senter
          )
        ]),
      ),
    );
  }

  Future<void> sendEmail() async {
    // currently no fucntionality
   
  EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app); // app arguement isnt valid. unsure of what goes on here. have tried "MyApp()", "app" , and empty 
    await authProvider.resetPassword(_emailcontroller.text.trim());  // this retrieves the users input from the text box and converts it to a string.
   
    // await this.
    // final Email send_email = Email(
    //   body: 'body of email',
    //   subject: 'subject of email',
    //   recipients: ['parveen2221@gmail.com'],
    // );
    // await FlutterEmailSender.send(send_email);
  }
}
