class SignInModel {
  final String message, token;

  SignInModel({required this.message, required this.token});
  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(message: jsonData['message'], token: jsonData['token']);
  }
}
