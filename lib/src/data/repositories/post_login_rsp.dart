/// message : "Đăng nhập thành công"
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vaGFoYXRlYS50aGllbmRldjIwMi5pZC52bi9hcGkvYXV0aC9zb2NpYWwiLCJpYXQiOjE2OTE2ODAyMzMsImV4cCI6MTY5MTcwMjEzMywibmJmIjoxNjkxNjgwMjMzLCJqdGkiOiJuVmk2NjQzcDdKREttRThJIiwic3ViIjoiMTE4IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.ixp0PRtMjnmb3KQy3DM3H-jneX-qABHTWCWr_TIttNQ"
/// expires_in : 365
/// uid : "118"

class PostLoginRsp {
  PostLoginRsp({
      String? message, 
      String? accessToken, 
      num? expiresIn, 
      String? uid,}){
    _message = message;
    _accessToken = accessToken;
    _expiresIn = expiresIn;
    _uid = uid;
}

  PostLoginRsp.fromJson(dynamic json) {
    _message = json['message'];
    _accessToken = json['access_token'];
    _expiresIn = json['expires_in'];
    _uid = json['uid'];
  }
  String? _message;
  String? _accessToken;
  num? _expiresIn;
  String? _uid;
PostLoginRsp copyWith({  String? message,
  String? accessToken,
  num? expiresIn,
  String? uid,
}) => PostLoginRsp(  message: message ?? _message,
  accessToken: accessToken ?? _accessToken,
  expiresIn: expiresIn ?? _expiresIn,
  uid: uid ?? _uid,
);
  String? get message => _message;
  String? get accessToken => _accessToken;
  num? get expiresIn => _expiresIn;
  String? get uid => _uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['access_token'] = _accessToken;
    map['expires_in'] = _expiresIn;
    map['uid'] = _uid;
    return map;
  }

}