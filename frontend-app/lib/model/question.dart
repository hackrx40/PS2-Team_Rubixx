// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  String question;
  List<String> answers;
  String correctAnswer;
  String? markedAnswer;
  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    this.markedAnswer,
  });

  Question copyWith({
    String? question,
    List<String>? answers,
    String? correctAnswer,
    String? markedAnswer,
  }) {
    return Question(
      question: question ?? this.question,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      markedAnswer: markedAnswer ?? this.markedAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answers': answers,
      'correctAnswer': correctAnswer,
      'markedAnswer': markedAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] as String,
      answers: List<String>.from((map['answers'] as List<String>)),
      correctAnswer: map['correctAnswer'] as String,
      markedAnswer:
          map['markedAnswer'] != null ? map['markedAnswer'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Question(question: $question, answers: $answers, correctAnswer: $correctAnswer, markedAnswer: $markedAnswer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.question == question &&
        listEquals(other.answers, answers) &&
        other.correctAnswer == correctAnswer &&
        other.markedAnswer == markedAnswer;
  }

  @override
  int get hashCode {
    return question.hashCode ^
        answers.hashCode ^
        correctAnswer.hashCode ^
        markedAnswer.hashCode;
  }
}