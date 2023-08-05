/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RlYTM1Ni5raGFuaG5oYXQudG9wL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjkwODE4ODg3LCJleHAiOjE2OTA4MjI0ODcsIm5iZiI6MTY5MDgxODg4NywianRpIjoiN1FpdVBpRnFTaHQycHVTdyIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ACIP2hexIxbuuOoyGTuYtiKRR7nDeZVJsD2P9tuakdE"
/// token_type : "bearer"
/// expires_in : 3600

class PostLoginRsp {
  PostLoginRsp({
      String? accessToken, 
      String? tokenType, 
      num? expiresIn,}){
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
}

  PostLoginRsp.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
  }
  String? _accessToken;
  String? _tokenType;
  num? _expiresIn;
PostLoginRsp copyWith({  String? accessToken,
  String? tokenType,
  num? expiresIn,
}) => PostLoginRsp(  accessToken: accessToken ?? _accessToken,
  tokenType: tokenType ?? _tokenType,
  expiresIn: expiresIn ?? _expiresIn,
);
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  num? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    return map;
  }

}