import 'package:flutter/material.dart';
import 'DemoApp.dart';
import 'question_model.dart';

import 'package:flutter_application_1/constant.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class QuizScreen extends StatefulWidget {
  String email;

  QuizScreen({required this.email});
  State<QuizScreen> createState() => _QuizScreenState(email: '${email}');
}

class _QuizScreenState extends State<QuizScreen> {
  String email;
  int happinessScale = 0;
  _QuizScreenState({required this.email});
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int count = 0;
  int score = 0;
  Answer? selectedAnswer;
  var db = mongo.Db.create(MONGO_URL_CHECKIN);

  Widget build(BuildContext context) {
    var collection = _openDatabase();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 131, 229),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Check-In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(collection, db),
          _nextButton(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 63, 80, 110),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  _answerList(var collection, var db) {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e, collection),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer, var collection) {
    bool isSelected = answer == selectedAnswer;
    return Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ElevatedButton(
          child: Text(answer.answerText),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: isSelected
                ? Color.fromARGB(255, 107, 109, 113)
                : Color.fromARGB(255, 231, 232, 235),
            onPrimary: isSelected
                ? Color.fromARGB(255, 0, 0, 0)
                : Color.fromARGB(255, 14, 14, 14),
          ),
          onPressed: () async {
            if (selectedAnswer == null) {
              // count = count + 1;
              happinessScale = happinessScale + answer.happyScale;
              // String choice = answer.answerText;

              // var db = await mongo.Db.create(MONGO_URL_CHECKIN);
              // await db.open(); //wait for it to open
              // var userCollection = // connect to the specific table
              //     db.collection(COLLECTION_NAME_checkin);

              // await userCollection.insert({"${count}": choice});
              // if (answer.isCorrect) {
              //   score++;
              // }
              // addToDatabase(choice, collection, db);
            }
            setState(() {
              selectedAnswer = answer;
            });
          },
        ));
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 48,
        child: ElevatedButton(
          child: Text(isLastQuestion ? "Submit" : "Next"),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.blueAccent,
            onPrimary: Colors.white,
          ),
          onPressed: () async {
            if (isLastQuestion) {
              var db = await mongo.Db.create(MONGO_URL_CHECKIN);
              await db.open(); //wait for it to open
              var userCollection = // connect to the specific table
                  db.collection(COLLECTION_NAME_checkin);

              await userCollection.insert(
                  {"ID": "${email}", "Happiness Scale: ": happinessScale});
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DemoApp(
                        email: ('${email}'),
                      )));
            } else {
              setState(() {
                selectedAnswer = null;
                currentQuestionIndex++;
              });
            }
          },
        ));
  }

  Future<mongo.DbCollection> _openDatabase() async {
    var db = await mongo.Db.create(MONGO_URL_CHECKIN);
    var userCollection = // connect to the specific table
        db.collection(COLLECTION_NAME_checkin);
    return userCollection;
  }

  // addToDatabase(String choice, var collection, var db) async {
  //   await db.open(); //wait for it to open
  //   print("TEST TEST: ${collection}\n");
  //   await collection.insert({"${count}": choice});
  // }
}
