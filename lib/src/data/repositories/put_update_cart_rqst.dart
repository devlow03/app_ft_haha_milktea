/// uid : "118"
/// id : "1"
/// type : "+"

class PutUpdateCartRqst {
  PutUpdateCartRqst({
      String? uid, 
      String? id, 
      String? type,}){
    _uid = uid;
    _id = id;
    _type = type;
}

  PutUpdateCartRqst.fromJson(dynamic json) {
    _uid = json['uid'];
    _id = json['id'];
    _type = json['type'];
  }
  String? _uid;
  String? _id;
  String? _type;
PutUpdateCartRqst copyWith({  String? uid,
  String? id,
  String? type,
}) => PutUpdateCartRqst(  uid: uid ?? _uid,
  id: id ?? _id,
  type: type ?? _type,
);
  String? get uid => _uid;
  String? get id => _id;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['id'] = _id;
    map['type'] = _type;
    return map;
  }

}