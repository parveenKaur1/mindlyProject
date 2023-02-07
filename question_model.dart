class Question {
  final String questionText;

  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final int happyScale;

  Answer(this.answerText, this.happyScale);
}

List<Question> getQuestion() {
  List<Question> list = [];

  list.add(Question("How are you feeling today?", [
    Answer("Happy", 18),
    Answer("Ecstatic", 20),
    Answer("Okay", 10),
    Answer("Anxious", 8),
    Answer("Stressed", 5),
    Answer("Hurt", 2),
    Answer("Depressed", 1),
  ]));
  list.add(Question("How are your stress levels lately?", [
    Answer("0-25%", 5),
    Answer("25-50%", 10),
    Answer("50-75%", 15),
    Answer("75-100%", 20),
  ]));
  list.add(Question("Have I been socializing less?", [
    Answer("Yes, less than before", 5),
    Answer("About as much as before", 15),
    Answer("No, I have been socializing more", 20),
  ]));
  list.add(Question(
      "How often did I look at the bright side of things yesterday? ", [
    Answer("Barely, Its been hard focusing on the good lately", 5),
    Answer("I made an effort but still felt down", 10),
    Answer(
        "A lot. It's been easier to do so than focusing on what I can't change",
        20),
  ]));
  list.add(Question("Are you feeling alone?", [
    Answer("Yes, it sometimes feels like no one gets me", 5),
    Answer(
        "No, I have people around me but I just didnt feel like talking to them",
        10),
    Answer("No, I am surrounded by people who love and care about me", 20),
  ]));

  return list;
}
