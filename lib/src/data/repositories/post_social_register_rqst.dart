/// name : "a"
/// email : "thien@gmail.com"
/// password : "'"
/// avatar : "a.png"
/// social : "gg"

class PostSocialRegisterRqst {
  PostSocialRegisterRqst({
      String? name, 
      String? email, 
      String? password, 
      String? avatar, 
      String? social,}){
    _name = name;
    _email = email;
    _password = password;
    _avatar = avatar;
    _social = social;
}

  PostSocialRegisterRqst.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _avatar = json['avatar'];
    _social = json['social'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _avatar;
  String? _social;
PostSocialRegisterRqst copyWith({  String? name,
  String? email,
  String? password,
  String? avatar,
  String? social,
}) => PostSocialRegisterRqst(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  avatar: avatar ?? _avatar,
  social: social ?? _social,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get avatar => _avatar;
  String? get social => _social;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['avatar'] = _avatar;
    map['social'] = _social;
    return map;
  }

}