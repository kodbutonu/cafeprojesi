class LoginResponse {
  final bool result;
  final String name;
  final String user_id;

  LoginResponse({
    required this.result,
    required this.name,
    required this.user_id,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      result: json['result'],
      name: json['name'],
      user_id: json['user_id'],
    );
  }
}
