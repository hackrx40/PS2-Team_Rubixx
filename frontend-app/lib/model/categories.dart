import 'dart:convert';

class Categories {
  String title;
  bool clicked;
  String image;
  Categories({
    required this.title,
    required this.clicked,
    required this.image,
  });

  Categories copyWith({
    String? title,
    bool? clicked,
    String? image,
  }) {
    return Categories(
      title: title ?? this.title,
      clicked: clicked ?? this.clicked,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'clicked': clicked,
      'image': image,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      title: map['title'] as String,
      clicked: map['clicked'] as bool,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Categories(title: $title, clicked: $clicked, image: $image)';

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.clicked == clicked &&
        other.image == image;
  }

  @override
  int get hashCode => title.hashCode ^ clicked.hashCode ^ image.hashCode;
}
