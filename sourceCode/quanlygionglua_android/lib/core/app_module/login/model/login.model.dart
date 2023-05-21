class LoginModel {
  final String _accesstoken;

  LoginModel(this._accesstoken);

  String get accessToken => _accesstoken;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(json['access_token']);
  }
}