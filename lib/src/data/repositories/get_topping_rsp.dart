/// status : 200
/// topping : [{"id_topping":"1","name_topping":"Hạt Sen","price":"7000"},{"id_topping":"2","name_topping":"Hạt Thủy Tinh Củ Năng","price":"5000"},{"id_topping":"3","name_topping":"Hạt Thủy Tinh Lúa Mạch","price":"5000"},{"id_topping":"4","name_topping":"Kem Tươi Vani","price":"7000"},{"id_topping":"5","name_topping":"Nếp Cẩm","price":"5000"},{"id_topping":"6","name_topping":"Pudding Socola","price":"7000"},{"id_topping":"7","name_topping":"Pudding Trứng","price":"7000"},{"id_topping":"8","name_topping":"Trân Châu Trắng","price":"5000"},{"id_topping":"9","name_topping":"Trân Châu Đen","price":"5000"},{"id_topping":"10","name_topping":"Trân Châu Đường Đen ","price":"5000"}]

class GetToppingRsp {
  GetToppingRsp({
      num? status, 
      List<Topping>? topping,}){
    _status = status;
    _topping = topping;
}

  GetToppingRsp.fromJson(dynamic json) {
    _status = json['status'];
    if (json['topping'] != null) {
      _topping = [];
      json['topping'].forEach((v) {
        _topping?.add(Topping.fromJson(v));
      });
    }
  }
  num? _status;
  List<Topping>? _topping;
GetToppingRsp copyWith({  num? status,
  List<Topping>? topping,
}) => GetToppingRsp(  status: status ?? _status,
  topping: topping ?? _topping,
);
  num? get status => _status;
  List<Topping>? get topping => _topping;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_topping != null) {
      map['topping'] = _topping?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id_topping : "1"
/// name_topping : "Hạt Sen"
/// price : "7000"

class Topping {
  Topping({
      String? idTopping, 
      String? nameTopping, 
      String? price,}){
    _idTopping = idTopping;
    _nameTopping = nameTopping;
    _price = price;
}

  Topping.fromJson(dynamic json) {
    _idTopping = json['id_topping'];
    _nameTopping = json['name_topping'];
    _price = json['price'];
  }
  String? _idTopping;
  String? _nameTopping;
  String? _price;
Topping copyWith({  String? idTopping,
  String? nameTopping,
  String? price,
}) => Topping(  idTopping: idTopping ?? _idTopping,
  nameTopping: nameTopping ?? _nameTopping,
  price: price ?? _price,
);
  String? get idTopping => _idTopping;
  String? get nameTopping => _nameTopping;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_topping'] = _idTopping;
    map['name_topping'] = _nameTopping;
    map['price'] = _price;
    return map;
  }

}