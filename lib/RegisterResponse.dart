class RegisterReponse {
  final bool result;
  final String name;
  final String user_id;

  RegisterReponse({
    required this.result,
    required this.name,
    required this.user_id,
  });

  factory RegisterReponse.fromJson(Map<String, dynamic> json) {
    return RegisterReponse(
      result: json['result'],
      name: json['name'],
      user_id: json['user_id'],
    );
  }
}
