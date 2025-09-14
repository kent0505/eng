class Lesson {
  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.position,
  });

  final int id;
  final String title;
  final String content;
  final double position;

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
