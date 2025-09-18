class Lesson {
  Lesson({
    this.id = 0,
    required this.title,
    required this.content,
    this.position = 0,
  });

  final int id;
  String title;
  String content;
  double position;

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'position': position,
    };
  }
}
