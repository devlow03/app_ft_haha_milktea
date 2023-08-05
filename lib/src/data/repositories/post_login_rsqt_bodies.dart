/// email : "thien1@gmail.com"
/// password : "123457"

class PostLoginRsqtBodies {
  PostLoginRsqtBodies({
      String? email, 
      String? password,}){
    _email = email;
    _password = password;
}

  PostLoginRsqtBodies.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
  }
  String? _email;
  String? _password;
PostLoginRsqtBodies copyWith({  String? email,
  String? password,
}) => PostLoginRsqtBodies(  email: email ?? _email,
  password: password ?? _password,
);
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

}