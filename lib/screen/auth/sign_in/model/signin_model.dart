class SignInModel {
  final String email;
  final String password;

  SignInModel({
    required this.email,
    required this.password,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json["email"] ?? '', //will be null when there is no value
      password: json["password"] ?? '',
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
