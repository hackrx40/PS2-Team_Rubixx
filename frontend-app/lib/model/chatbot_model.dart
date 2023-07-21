// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatbotModel {
  String text;
  DateTime dateTime;
  bool? isChatFromBot;
  ChatbotModel({
    required this.text,
    required this.dateTime,
    this.isChatFromBot,
  });

  ChatbotModel copyWith({
    String? text,
    DateTime? dateTime,
    bool? isChatFromBot,
  }) {
    return ChatbotModel(
      text: text ?? this.text,
      dateTime: dateTime ?? this.dateTime,
      isChatFromBot: isChatFromBot ?? this.isChatFromBot,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isChatFromBot': isChatFromBot,
    };
  }

  factory ChatbotModel.fromMap(Map<String, dynamic> map) {
    return ChatbotModel(
      text: map['text'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      isChatFromBot:
          map['isChatFromBot'] != null ? map['isChatFromBot'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatbotModel.fromJson(String source) =>
      ChatbotModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChatbotModel(text: $text, dateTime: $dateTime, isChatFromBot: $isChatFromBot)';

  @override
  bool operator ==(covariant ChatbotModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.dateTime == dateTime &&
        other.isChatFromBot == isChatFromBot;
  }

  @override
  int get hashCode =>
      text.hashCode ^ dateTime.hashCode ^ isChatFromBot.hashCode;
}
