/// name : "Thien"
/// email : "thien@gmail.com"
/// password : "huaquangthien123"
/// avatar : "1.jpg"
/// social : "google"
/// city : "Cần Thơ"
/// district : "NIinh Kiều"
/// street : "Nguyễn Đệ"

class PostSocialRegisterRqst {
  PostSocialRegisterRqst({
      String? name, 
      String? email, 
      String? password, 
      String? avatar, 
      String? social, 
      String? city, 
      String? district, 
      String? street,}){
    _name = name;
    _email = email;
    _password = password;
    _avatar = avatar;
    _social = social;
    _city = city;
    _district = district;
    _street = street;
}

  PostSocialRegisterRqst.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _avatar = json['avatar'];
    _social = json['social'];
    _city = json['city'];
    _district = json['district'];
    _street = json['street'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _avatar;
  String? _social;
  String? _city;
  String? _district;
  String? _street;
PostSocialRegisterRqst copyWith({  String? name,
  String? email,
  String? password,
  String? avatar,
  String? social,
  String? city,
  String? district,
  String? street,
}) => PostSocialRegisterRqst(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  avatar: avatar ?? _avatar,
  social: social ?? _social,
  city: city ?? _city,
  district: district ?? _district,
  street: street ?? _street,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get avatar => _avatar;
  String? get social => _social;
  String? get city => _city;
  String? get district => _district;
  String? get street => _street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['avatar'] = _avatar;
    map['social'] = _social;
    map['city'] = _city;
    map['district'] = _district;
    map['street'] = _street;
    return map;
  }

}