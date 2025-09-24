class Lesson {
  Lesson({
    this.id = 0,
    required this.title,
    required this.data,
    this.position = 0,
  });

  final int id;
  String title;
  String data;
  double position;

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      data: json['data'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'data': data,
      'position': position,
    };
  }
}
