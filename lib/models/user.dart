class User {
  final String fullName;
  final String email;
  final String password;
  final String phone;

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'email': email,
    'password': password,
    'phone': phone,
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    fullName: json['fullName'] ?? '',
    email: json['email'] ?? '',
    password: json['password'] ?? '',
    phone: json['phone'] ?? '',
  );
}
