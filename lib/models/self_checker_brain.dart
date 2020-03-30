import 'self_checker_model.dart';

class SelfCheckerBrain {
  int _questionNumber = 0;

  List<SelfChecker> _selfCheckerData = [
    SelfChecker(
        selfCheckQuestion:
            'By using this tool, you agree to its terms and that Flutter Zimbabwe will not be liable for any harm relating to your use.',
        answer1: 'I agree, proceed',
        answer2: 'Cancel'),
    SelfChecker(
        selfCheckQuestion:
            'Have you had any of these symptoms in the last 14 days: Fever, Cough, Sneezing, Sore Throat, Difficulty in Breathing',
        answer1: 'No',
        answer2: 'Yes'),
    SelfChecker(
        selfCheckQuestion:
            'Do you have any of these conditions: Asthma, Diabetes, Weakened Immune System, Obesity',
        answer1: 'No',
        answer2: 'Yes'),
    SelfChecker(
        selfCheckQuestion:
            'In the last 14 days, have you been in an area where COVID-19 is widespread?',
        answer1: 'No',
        answer2: 'Yes'),
    SelfChecker(
        selfCheckQuestion:
            'In the last 14 days, have you been exposed to others who are known to have COVID-19?',
        answer1: 'No',
        answer2: 'Yes'),
    SelfChecker(
        selfCheckQuestion: 'Do you live or work in a care facility?',
        answer1: 'No',
        answer2: 'Yes')
  ];

  String getSelfChecker() {
    return _selfCheckerData[_questionNumber].selfCheckQuestion;
  }

  String getAnswer1() {
    return _selfCheckerData[_questionNumber].answer1;
  }

  String getAnswer2() {
    return _selfCheckerData[_questionNumber].answer2;
  }

  void nextSelfChecker(int choiceNumber) {
    if (choiceNumber == 1 && _questionNumber == 0) {
      _questionNumber = 1;
    } else if (choiceNumber == 2 && _questionNumber == 0) {
      _questionNumber = 1;
    } else if (choiceNumber == 1 && _questionNumber == 1) {
      _questionNumber = 2;
    } else if (choiceNumber == 2 && _questionNumber == 1) {
      _questionNumber = 2;
    } else if (choiceNumber == 1 && _questionNumber == 2) {
      _questionNumber = 5;
    } else if (choiceNumber == 2 && _questionNumber == 2) {
      _questionNumber = 4;
    } else if (_questionNumber == 3 ||
        _questionNumber == 4 ||
        _questionNumber == 5) {
      restart();
    }
  }

  bool buttonShouldBeVisible() {
    if (_questionNumber == 0) {
      return true;
    } else if (_questionNumber == 1) {
      return true;
    } else if (_questionNumber == 2) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    _questionNumber = 0;
  }
}
