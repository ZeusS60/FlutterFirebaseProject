//I have used JSON to Dart Converter for this page but I had to be fixed some line
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String? id;
  String? title;
  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  set imageUrl(String? value) {
    _imageUrl = value;
  }
  String? description;
  int? timeSeconds;
  List<Questions>? questions;
  int? questionCount;

  QuestionPaperModel(
      {this.id,
      this.title,
      String? imageUrl,
      this.description,
      this.timeSeconds,
      this.questions,
      this.questionCount}) : _imageUrl = imageUrl;

 QuestionPaperModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    title = json['title'] as String?,
    _imageUrl = json['image_url'] as String?,
    description = json['Description'] as String?,
    timeSeconds = json['time_seconds'],
    questionCount = 0,
  questions = (json['questions'] as List).map((dynamic e) => Questions.fromJson(e as Map<String,dynamic>)).toList();

   QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> json):
    id = json.id,
    title = json['title'],
    _imageUrl = json['image_url'],
    description = json['Description'],
    timeSeconds = json['time_seconds'],
    questionCount = json['questions_count'] as int,
  questions = [];
  
  String timeInMinits() => "${(timeSeconds! / 60).ceil()} mins";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;
    if (questions != null) {
      data['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? id;
  String? question;
  List<Answers>? answers;
  String? correctAnswer;

  Questions({this.id, this.question, this.answers, this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json):
    id = json['id'],
    question = json['question'],
    answers = (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
    correctAnswer = json['correct_answer'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    if (answers != null) {
      data['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json):
    identifier = json['identifier'],
    answer = json['Answer'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}


/*class Answer {
  final String? identifier;
 final String? answer;
 Answer({this.identifier,this.answer});

  Answer.fromJSON(Map<String,dynamic> json)
  : identifier = json['identifier'] as String?,
  answer = json['answer'] as String?;
  
}*/