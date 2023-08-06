/// message : "Đăng nhập thành công"
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vaGFoYXRlYS50aGllbmRldjIwMi5pZC52bi9hcGkvYXV0aC9zb2NpYWwiLCJpYXQiOjE2OTEyOTY1NjgsImV4cCI6MTY5MTMxODQ2OCwibmJmIjoxNjkxMjk2NTY4LCJqdGkiOiI0eEJLUDNGZkVFd00zeVlVIiwic3ViIjoiMTAyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.xI19E3bzRAj7cap4Hkggjn6LwcWiNGwqpD3OI42mruI"
/// expires_in : 365

class PostLoginRsp {
  PostLoginRsp({
      String? message, 
      String? accessToken, 
      num? expiresIn,}){
    _message = message;
    _accessToken = accessToken;
    _expiresIn = expiresIn;
}

  PostLoginRsp.fromJson(dynamic json) {
    _message = json['message'];
    _accessToken = json['access_token'];
    _expiresIn = json['expires_in'];
  }
  String? _message;
  String? _accessToken;
  num? _expiresIn;
PostLoginRsp copyWith({  String? message,
  String? accessToken,
  num? expiresIn,
}) => PostLoginRsp(  message: message ?? _message,
  accessToken: accessToken ?? _accessToken,
  expiresIn: expiresIn ?? _expiresIn,
);
  String? get message => _message;
  String? get accessToken => _accessToken;
  num? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['access_token'] = _accessToken;
    map['expires_in'] = _expiresIn;
    return map;
  }

}