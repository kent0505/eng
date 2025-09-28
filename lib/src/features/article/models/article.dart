class Article {
  Article({
    this.id = 0,
    required this.title,
    required this.data,
    this.cid = 0,
  });

  final int id;
  String title;
  String data;
  int cid;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      data: json['data'],
      cid: json['cid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'data': data,
      'cid': cid,
    };
  }
}
