/// status : 200
/// data : {"id":"121","name":"Hua Quang","email":"dungshopee202@gmail.com","phone":null,"avatar":"https://lh3.googleusercontent.com/a/AAcHTtcrDkOa6MhU7iGIKdI0cbDRrUdXaxmSl41lR2AA-9_h=s96-c","city":"Cần Thơ","district":"Ninh Kiều","street":"59 Đ. Mậu Thân"}

class GetProfileRsp {
  GetProfileRsp({
      num? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  GetProfileRsp.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  Data? _data;
GetProfileRsp copyWith({  num? status,
  Data? data,
}) => GetProfileRsp(  status: status ?? _status,
  data: data ?? _data,
);
  num? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : "121"
/// name : "Hua Quang"
/// email : "dungshopee202@gmail.com"
/// phone : null
/// avatar : "https://lh3.googleusercontent.com/a/AAcHTtcrDkOa6MhU7iGIKdI0cbDRrUdXaxmSl41lR2AA-9_h=s96-c"
/// city : "Cần Thơ"
/// district : "Ninh Kiều"
/// street : "59 Đ. Mậu Thân"

class Data {
  Data({
      String? id, 
      String? name, 
      String? email, 
      dynamic phone, 
      String? avatar, 
      String? city, 
      String? district, 
      String? street,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _avatar = avatar;
    _city = city;
    _district = district;
    _street = street;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _avatar = json['avatar'];
    _city = json['city'];
    _district = json['district'];
    _street = json['street'];
  }
  String? _id;
  String? _name;
  String? _email;
  dynamic _phone;
  String? _avatar;
  String? _city;
  String? _district;
  String? _street;
Data copyWith({  String? id,
  String? name,
  String? email,
  dynamic phone,
  String? avatar,
  String? city,
  String? district,
  String? street,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  avatar: avatar ?? _avatar,
  city: city ?? _city,
  district: district ?? _district,
  street: street ?? _street,
);
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get phone => _phone;
  String? get avatar => _avatar;
  String? get city => _city;
  String? get district => _district;
  String? get street => _street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['avatar'] = _avatar;
    map['city'] = _city;
    map['district'] = _district;
    map['street'] = _street;
    return map;
  }

}