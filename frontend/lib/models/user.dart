class User {
  User(
      {required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.token,
      required this.balance});

  final int id;
  final String username;
  final String password;
  final String email;
  final String token;
  final double balance;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        balance: json['balance'].toDouble(),
        token: json['token']);
  }
}
