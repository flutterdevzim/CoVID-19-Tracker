import 'self_checker_model.dart';

class SelfCheckerBrain {
  int _questionNumber = 0;
  int _yesCounter = 0;

  List<SelfChecker> _selfCheckerData = [
    SelfChecker(
        selfCheckQuestion:
            'By using this tool, you agree to its terms and conditions,we will not be liable for any harm relating to your use.',
        answer1: 'I Agree',
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
        answer2: 'Yes'),
    SelfChecker(
        selfCheckQuestion: 'Show Results?', answer1: 'No', answer2: 'Yes'),
    SelfChecker(
        selfCheckQuestion:
            'Based on your answers, it would be good to seek medical attention immediately. '
            'Please use the emergency numbers on the Hotline Page',
        answer1: 'Restart',
        answer2: ''),
    SelfChecker(
        selfCheckQuestion:
            'You dont seem to be infected, however please continue to follow prevention guidelines.',
        answer1: 'Restart',
        answer2: ''),
  ];

  String getSelfChecker() {
    return _selfCheckerData[_questionNumber].selfCheckQuestion;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  String getAnswer1() {
    return _selfCheckerData[_questionNumber].answer1;
  }

  String getAnswer2() {
    return _selfCheckerData[_questionNumber].answer2;
  }

  void nextSelfChecker(int choiceNumber) {
    if (choiceNumber == 1 && _questionNumber == 0) {
      _questionNumber++;
      _yesCounter++;
    } else if (choiceNumber == 2 && _questionNumber == 0) {
      _questionNumber++;
    } else if (choiceNumber == 1 && _questionNumber == 1) {
      _questionNumber++;
    } else if (choiceNumber == 2 && _questionNumber == 1) {
      _questionNumber++;
      _yesCounter++;
    } else if (choiceNumber == 1 && _questionNumber == 2) {
      _questionNumber++;
    } else if (choiceNumber == 2 && _questionNumber == 2) {
      _questionNumber++;
      _yesCounter++;
    } else if (choiceNumber == 1 && _questionNumber == 3) {
      _questionNumber++;
    } else if (choiceNumber == 2 && _questionNumber == 3) {
      _questionNumber++;
      _yesCounter++;
    } else if (choiceNumber == 1 && _questionNumber == 4) {
      _questionNumber++;
    } else if (choiceNumber == 2 && _questionNumber == 4) {
      _questionNumber++;
      _yesCounter++;
    } else if (choiceNumber == 1 && _questionNumber == 5) {
      _questionNumber++;
    } else if (choiceNumber == 2 && _questionNumber == 5) {
      _questionNumber++;
      _yesCounter++;
    } else if (choiceNumber == 1 && _questionNumber == 6) {
      restart();
    } else if (choiceNumber == 2 && _questionNumber == 6 && _yesCounter > 3) {
      _questionNumber = 7;
    } else if (choiceNumber == 2 && _questionNumber == 6 && _yesCounter <= 3) {
      _questionNumber = 8;
    } else if (choiceNumber == 1 && _questionNumber == 7) {
      restart();
    } else if (choiceNumber == 1 && _questionNumber == 8) {
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
    } else if (_questionNumber == 3) {
      return true;
    } else if (_questionNumber == 4) {
      return true;
    } else if (_questionNumber == 5) {
      return true;
    } else if (_questionNumber == 6) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    _questionNumber = 0;
    _yesCounter = 0;
  }
}
