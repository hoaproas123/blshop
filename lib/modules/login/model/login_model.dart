class LoginModel  {
  String? url;

  LoginModel({
    this.url,
  });

  factory LoginModel.initial() {
    return LoginModel(url: '',);
  }

}
