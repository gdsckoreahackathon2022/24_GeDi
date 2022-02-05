import 'Question.dart';

class QuizData{
  int QuizNum = 0;
  int Result = 0;
  int Level = 0;
  List<Question> QuizDB = [
    Question('분모/분자는 성차별 단어로 윗수/아랫수로 단어를 사용해야한다.', true, 1,'어머니가 아들을 업는 의미로 사용되고 있기 때문에 윗수와 아랫수로 나누어 사용한다.'),
    Question('효자손, 효자매물은 등긁개,인기매물의 올바른 표현이다.', false, 1,'등긁개와 인기매물은 효자손, 효자매물의 성평등 단어로 아들을 중심으로 하는 단어의 형태를 단어의 쓰임에 중점을 두어 변형시켜주었다.'),
    Question('영미권의 직업명에서는 성차별적인 단어를 찾아볼 수 없다.', false, 1,'Policeman, Fireman, housewife 등 특정 직업의 경우 특정 성별을 의미하는 단어로 구성이 되어있다. 해당 단어는 각각 Police Officer, Fire Fighter, houseperson의 단어로 사용해주는 것이 좋다.'),
    Question('어린아이를 위한 스쿨버스를 타는 장소를 맘스스테이션이라고 한다.', true, 1,'어린아이를 아침에 등교, 등원시킬 때 어머니가 주로 이용을 하기에 맘스스테이션이라고 지칭하는 사람이 많지만, 해당 표현은 올바르지 않은 표현으로 어린이 승하차장이 옳은 표현이다.'),
    Question('우리나라 법률에는 성차별적인 단어가 존재하지 않는다.', false, 1,'도시와 농어촌간의 교류촉진에 관한 법률에는 도농자매결연이라는 용어가 사용되고 있다. 이는 지역간의 교류에서 언니와 여동생이 관계를 맺는 의미로 성별에 대한 고정관념을 불러일으킬 수 있어 상호결연과 같은 단어를 사용해주는 것이 좋다.'),
  ];

  List<String> Endcomment = [
    'Try Again!','Oops!!!','Soso','Perfect!!!'
  ];

  void TestLevel(int r) {
    if (r >= 4) {
      Level = 3;
    } else if (r >= 2) {
      Level = 2;
    } else if (r >= 0) {
      Level = 1;
    } else {
      Level = 0;
    }
  }

  void nextQ() {
    if(QuizNum < QuizDB.length -1){
      QuizNum ++;
    }
  }

  void setResult(int r){
    Result = r;
    TestLevel(r);
  }

  int getResult(){
    return Result;
  }

  int getLevel(){
    return Level;
  }

  int getQuizType(){
    return QuizDB[QuizNum].questionType;
  }

  int gettotalQuiz(){
    return QuizDB.length;
  }

  int getQuizNum(){
    return QuizNum;
  }

  String getQuizText(){
    return QuizDB[QuizNum].questionText;
  }

  String getQuizText_n(int n){
    return QuizDB[n].questionText;
  }

  bool getQuizAnswer(){
    return QuizDB[QuizNum].questionAnswer;
  }

  bool getQuizAnswer_n(int n){
    return QuizDB[n].questionAnswer;
  }

  String getComment(){
    return Endcomment[Level];
  }

  String getExp(int n){
    return QuizDB[n].questionExp;
  }

  bool QuizFinished() {
    if(QuizNum >= QuizDB.length -1) {
      return true;
    }
    else{
      return false;
    }
  }
  void reset(){
    QuizNum = 0;
  }
}