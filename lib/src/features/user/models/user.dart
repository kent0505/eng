class User {
  User({
    required this.id,
    required this.username,
    required this.age,
    required this.photo,
    required this.role,
  });

  final int id;
  final String username;
  final String? age;
  final String? photo;
  final String role;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      age: json['age'],
      photo: json['photo'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'age': age,
      'photo': photo,
      'role': role,
    };
  }
}
