/// status : 200
/// data : [{"id_cart":"89","uid":"118","id_category":"1","id":"1","name":"Tra sua nuong den","thumbnail":"https://phuctea.com.vn/wp-content/uploads/2022/09/2c4d23a12669e237bb78-1-e1663577633193-768x706.jpg","cost":"20000","options":null,"quantity":"2","current_price":"40000"}]
/// total : "80.000đ"

class GetCartRsp {
  GetCartRsp({
      num? status, 
      List<Data>? data, 
      String? total,}){
    _status = status;
    _data = data;
    _total = total;
}

  GetCartRsp.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _total = json['total'];
  }
  num? _status;
  List<Data>? _data;
  String? _total;
GetCartRsp copyWith({  num? status,
  List<Data>? data,
  String? total,
}) => GetCartRsp(  status: status ?? _status,
  data: data ?? _data,
  total: total ?? _total,
);
  num? get status => _status;
  List<Data>? get data => _data;
  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    return map;
  }

}

/// id_cart : "89"
/// uid : "118"
/// id_category : "1"
/// id : "1"
/// name : "Tra sua nuong den"
/// thumbnail : "https://phuctea.com.vn/wp-content/uploads/2022/09/2c4d23a12669e237bb78-1-e1663577633193-768x706.jpg"
/// cost : "20000"
/// options : null
/// quantity : "2"
/// current_price : "40000"

class Data {
  Data({
      String? idCart, 
      String? uid, 
      String? idCategory, 
      String? id, 
      String? name, 
      String? thumbnail, 
      String? cost, 
      dynamic options, 
      String? quantity, 
      String? currentPrice,}){
    _idCart = idCart;
    _uid = uid;
    _idCategory = idCategory;
    _id = id;
    _name = name;
    _thumbnail = thumbnail;
    _cost = cost;
    _options = options;
    _quantity = quantity;
    _currentPrice = currentPrice;
}

  Data.fromJson(dynamic json) {
    _idCart = json['id_cart'];
    _uid = json['uid'];
    _idCategory = json['id_category'];
    _id = json['id'];
    _name = json['name'];
    _thumbnail = json['thumbnail'];
    _cost = json['cost'];
    _options = json['options'];
    _quantity = json['quantity'];
    _currentPrice = json['current_price'];
  }
  String? _idCart;
  String? _uid;
  String? _idCategory;
  String? _id;
  String? _name;
  String? _thumbnail;
  String? _cost;
  dynamic _options;
  String? _quantity;
  String? _currentPrice;
Data copyWith({  String? idCart,
  String? uid,
  String? idCategory,
  String? id,
  String? name,
  String? thumbnail,
  String? cost,
  dynamic options,
  String? quantity,
  String? currentPrice,
}) => Data(  idCart: idCart ?? _idCart,
  uid: uid ?? _uid,
  idCategory: idCategory ?? _idCategory,
  id: id ?? _id,
  name: name ?? _name,
  thumbnail: thumbnail ?? _thumbnail,
  cost: cost ?? _cost,
  options: options ?? _options,
  quantity: quantity ?? _quantity,
  currentPrice: currentPrice ?? _currentPrice,
);
  String? get idCart => _idCart;
  String? get uid => _uid;
  String? get idCategory => _idCategory;
  String? get id => _id;
  String? get name => _name;
  String? get thumbnail => _thumbnail;
  String? get cost => _cost;
  dynamic get options => _options;
  String? get quantity => _quantity;
  String? get currentPrice => _currentPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_cart'] = _idCart;
    map['uid'] = _uid;
    map['id_category'] = _idCategory;
    map['id'] = _id;
    map['name'] = _name;
    map['thumbnail'] = _thumbnail;
    map['cost'] = _cost;
    map['options'] = _options;
    map['quantity'] = _quantity;
    map['current_price'] = _currentPrice;
    return map;
  }

}