class Word {
  Word({
    required this.en,
    required this.ru,
  });

  final String en;
  final String ru;

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      en: json['en'],
      ru: json['ru'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'ru': ru,
    };
  }
}
