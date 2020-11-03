// ignore: camel_case_types
class Quiz_data {
  final int id;
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final int aswerindex;

  Quiz_data(
      {this.id,
      this.question,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.aswerindex});
}

var quizes = [
  Quiz_data(
    id: 1,
    question: "استانی در ایران؟",
    answer1: "استانبول",
    answer2: "تهران",
    answer3: "باکو",
    answer4: "وان",
    aswerindex: 2,
  ),
  Quiz_data(
    id: 2,
    question: "استانی در ایران؟",
    answer1: "استانبول",
    answer2: "تهران",
    answer3: "باکو",
    answer4: "وان",
    aswerindex: 3,
  ),
  Quiz_data(
    id: 3,
    question: "استانی در ترکیه؟",
    answer1: "استانبول",
    answer2: "تهران",
    answer3: "باکو",
    answer4: "وان",
    aswerindex: 4,
  ),
  Quiz_data(
    id: 4,
    question: "استانی در ایران؟",
    answer1: "استانبول",
    answer2: "تهران",
    answer3: "باکو",
    answer4: "وان",
    aswerindex: 1,
  )
];
