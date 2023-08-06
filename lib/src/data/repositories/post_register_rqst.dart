/// phone : "84776506112"
/// password : "1234567"
/// password_confirmation : "1234567"

class PostRegisterRqst {
  PostRegisterRqst({
      String? phone, 
      String? password, 
      String? passwordConfirmation,}){
    _phone = phone;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
}

  PostRegisterRqst.fromJson(dynamic json) {
    _phone = json['phone'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }
  String? _phone;
  String? _password;
  String? _passwordConfirmation;
PostRegisterRqst copyWith({  String? phone,
  String? password,
  String? passwordConfirmation,
}) => PostRegisterRqst(  phone: phone ?? _phone,
  password: password ?? _password,
  passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
);
  String? get phone => _phone;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }

}