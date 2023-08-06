/// phone : "+84776506112"
/// password : "1234567"

class PostLoginRsqtBodies {
  PostLoginRsqtBodies({
      String? phone, 
      String? password,}){
    _phone = phone;
    _password = password;
}

  PostLoginRsqtBodies.fromJson(dynamic json) {
    _phone = json['phone'];
    _password = json['password'];
  }
  String? _phone;
  String? _password;
PostLoginRsqtBodies copyWith({  String? phone,
  String? password,
}) => PostLoginRsqtBodies(  phone: phone ?? _phone,
  password: password ?? _password,
);
  String? get phone => _phone;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['password'] = _password;
    return map;
  }

}