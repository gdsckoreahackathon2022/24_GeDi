class Question {
  String questionText = '';
  bool questionAnswer = true;
  int questionType = 0; //1 = O,X, 2 = ?
  String questionExp = '';

  Question(String q, bool a, int t, String e) {
    questionText = q;
    questionAnswer = a;
    questionType = t;
    questionExp = e;
  }
}