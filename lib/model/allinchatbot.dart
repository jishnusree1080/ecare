
class Question {
  final String question;
  final String responseKey;

  Question(this.question, this.responseKey);
}


List<Question> healthQuestions = [
  Question("What is your date of birth?", "dateOfBirth"),
  Question("What is your blood group?", "bloodGroup"),
  Question("Do you have any existing health conditions?", "healthConditions"),
  // Add more questions as needed
];