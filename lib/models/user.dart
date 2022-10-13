class User {
  int id;
  String? name;
  String? email;
  String? phone;

  User({required this.id, this.name, this.email, this.phone});

  factory User.fromJson(Map<String, dynamic> decodedJson) {
    return User(
      id: decodedJson['id'],
      name: decodedJson['name'],
      email: decodedJson['email'],
      phone: decodedJson['phone'],
    );
  }
}
