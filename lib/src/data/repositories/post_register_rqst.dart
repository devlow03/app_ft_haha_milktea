/// phone : "+84776506112"
/// email : "'"
/// password : "1234567"
/// password_confirmation : "1234567"

class PostRegisterRqst {
  PostRegisterRqst({
      String? phone, 
      String? email, 
      String? password, 
      String? passwordConfirmation,}){
    _phone = phone;
    _email = email;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
}

  PostRegisterRqst.fromJson(dynamic json) {
    _phone = json['phone'];
    _email = json['email'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }
  String? _phone;
  String? _email;
  String? _password;
  String? _passwordConfirmation;
PostRegisterRqst copyWith({  String? phone,
  String? email,
  String? password,
  String? passwordConfirmation,
}) => PostRegisterRqst(  phone: phone ?? _phone,
  email: email ?? _email,
  password: password ?? _password,
  passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
);
  String? get phone => _phone;
  String? get email => _email;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['email'] = _email;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }

}