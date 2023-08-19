/// phone : "84776506112"
/// password : "1234567"
/// password_confirmation : "1234567"
/// city : "Đồng Tháp"
/// district : "Lai Vung"
/// street : "Hòa Long"

class PostRegisterRqst {
  PostRegisterRqst({
      String? phone, 
      String? password, 
      String? passwordConfirmation, 
      String? city, 
      String? district, 
      String? street,}){
    _phone = phone;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
    _city = city;
    _district = district;
    _street = street;
}

  PostRegisterRqst.fromJson(dynamic json) {
    _phone = json['phone'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
    _city = json['city'];
    _district = json['district'];
    _street = json['street'];
  }
  String? _phone;
  String? _password;
  String? _passwordConfirmation;
  String? _city;
  String? _district;
  String? _street;
PostRegisterRqst copyWith({  String? phone,
  String? password,
  String? passwordConfirmation,
  String? city,
  String? district,
  String? street,
}) => PostRegisterRqst(  phone: phone ?? _phone,
  password: password ?? _password,
  passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
  city: city ?? _city,
  district: district ?? _district,
  street: street ?? _street,
);
  String? get phone => _phone;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;
  String? get city => _city;
  String? get district => _district;
  String? get street => _street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    map['city'] = _city;
    map['district'] = _district;
    map['street'] = _street;
    return map;
  }

}