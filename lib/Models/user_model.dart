class UserModel {
  final String username;
  final String email;
  final String password;
  final String id;

  UserModel(
      {required this.username,
      required this.email,
      required this.password,
      required this.id});

  factory UserModel.fromjson(Map<String, dynamic> map) {
    return UserModel(
        username: map['username'],
        email: map['email'],
        password: map['password'],
        id: map['id']);
  }
  Map<String, dynamic> tojson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'id': id
    };
  }
}
