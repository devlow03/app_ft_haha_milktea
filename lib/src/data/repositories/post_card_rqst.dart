/// uid : "118"
/// id_category : "1"
/// id : "1"
/// name : "Tra sua nuong den"
/// thumbnail : "https://phuctea.com.vn/wp-content/uploads/2022/09/2c4d23a12669e237bb78-1-e1663577633193-768x706.jpg"
/// cost : "20000"
/// current_price : "40000"
/// quantity : "2"

class PostCardRqst {
  PostCardRqst({
      String? uid, 
      String? idCategory, 
      String? id, 
      String? name, 
      String? thumbnail, 
      String? cost, 
      String? currentPrice, 
      String? quantity,}){
    _uid = uid;
    _idCategory = idCategory;
    _id = id;
    _name = name;
    _thumbnail = thumbnail;
    _cost = cost;
    _currentPrice = currentPrice;
    _quantity = quantity;
}

  PostCardRqst.fromJson(dynamic json) {
    _uid = json['uid'];
    _idCategory = json['id_category'];
    _id = json['id'];
    _name = json['name'];
    _thumbnail = json['thumbnail'];
    _cost = json['cost'];
    _currentPrice = json['current_price'];
    _quantity = json['quantity'];
  }
  String? _uid;
  String? _idCategory;
  String? _id;
  String? _name;
  String? _thumbnail;
  String? _cost;
  String? _currentPrice;
  String? _quantity;
PostCardRqst copyWith({  String? uid,
  String? idCategory,
  String? id,
  String? name,
  String? thumbnail,
  String? cost,
  String? currentPrice,
  String? quantity,
}) => PostCardRqst(  uid: uid ?? _uid,
  idCategory: idCategory ?? _idCategory,
  id: id ?? _id,
  name: name ?? _name,
  thumbnail: thumbnail ?? _thumbnail,
  cost: cost ?? _cost,
  currentPrice: currentPrice ?? _currentPrice,
  quantity: quantity ?? _quantity,
);
  String? get uid => _uid;
  String? get idCategory => _idCategory;
  String? get id => _id;
  String? get name => _name;
  String? get thumbnail => _thumbnail;
  String? get cost => _cost;
  String? get currentPrice => _currentPrice;
  String? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['id_category'] = _idCategory;
    map['id'] = _id;
    map['name'] = _name;
    map['thumbnail'] = _thumbnail;
    map['cost'] = _cost;
    map['current_price'] = _currentPrice;
    map['quantity'] = _quantity;
    return map;
  }

}