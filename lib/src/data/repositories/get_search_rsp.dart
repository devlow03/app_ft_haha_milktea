/// status : 200
/// products : [{"id":"1","name":"Trà sữa nướng đen","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/09/2c4d23a12669e237bb78-1-e1663577633193-768x706.jpg","price":"20000","id_category":"1","created_at":null,"updated_at":null},{"id":"2","name":"Trà sữa nướng","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/09/427ebefdbb357f6b2624-scaled-e1663577197601-300x300.jpg","price":"20000","id_category":"1","created_at":null,"updated_at":null},{"id":"3","name":"Trà sữa Oolong","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/09/427ebefdbb357f6b2624-scaled-e1663577197601-300x300.jpg","price":"20000","id_category":"1","created_at":null,"updated_at":null},{"id":"5","name":"Trà Sữa Hoàng Kim","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/04/39-300x300.jpg","price":"25000","id_category":"1","created_at":null,"updated_at":null},{"id":"6","name":"Trà Sữa Khoai Môn","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/04/23-300x300.jpg","price":"25000","id_category":"1","created_at":null,"updated_at":null},{"id":"7","name":"Trà sữa Milk Foam","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/04/16-300x300.jpg","price":"25000","id_category":"1","created_at":null,"updated_at":null},{"id":"8","name":"Trà sữa Phúc","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/04/15-300x300.jpg","price":"28000","id_category":"1","created_at":null,"updated_at":null},{"id":"9","name":"Trà Sữa Truyền Thống","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/11-300x300.jpg","price":"20000","id_category":"1","created_at":null,"updated_at":null},{"id":"10","name":"Trà Sữa Đài Loan","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/12-300x300.jpg","price":"25000","id_category":"1","created_at":null,"updated_at":null},{"id":"11","name":"Trà Sữa Sương Sáo","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/13-300x300.jpg","price":"20000","id_category":"1","created_at":null,"updated_at":null},{"id":"12","name":"Trà Sữa Pudding Flan","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/14-300x300.jpg","price":"25000","id_category":"1","created_at":null,"updated_at":null},{"id":"25","name":"Trà Sữa Socola","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/04/20-300x300.jpg","price":"25000","id_category":"3","created_at":null,"updated_at":null},{"id":"4","name":"Sữa Tươi Đường Đen","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/04/25.1-768x511.jpg","price":"30000","id_category":"1","created_at":null,"updated_at":null},{"id":"13","name":"Trà Hibicus – Xí Muội","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/04/10-1-300x300.jpg","price":"20000","id_category":"2","created_at":null,"updated_at":null},{"id":"14","name":"Lục Trà Chanh","thumnail":"https://phuctea.com.vn/wp-content/uploads/2022/04/9-300x300.jpg","price":"20000","id_category":"2","created_at":null,"updated_at":null},{"id":"15","name":"Trà vải hạt chia","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/4-1-300x300.jpg","price":"20000","id_category":"2","created_at":null,"updated_at":null},{"id":"16","name":"Trà Đào Hạt Chia","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/4-1-300x300.jpg","price":"20000","id_category":"2","created_at":null,"updated_at":null},{"id":"18","name":"Lục Trà Xoài","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/6-300x300.jpg","price":"25000","id_category":"2","created_at":null,"updated_at":null},{"id":"19","name":"Lục Trà Thơm - Coconut","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/7-300x300.jpg","price":"25000","id_category":"2","created_at":null,"updated_at":null},{"id":"20","name":"Lục Trà Cam Sả ","thumnail":"https://phuctea.com.vn/wp-content/uploads/2020/09/8-300x300.jpg","price":"20000","id_category":"2","created_at":null,"updated_at":null}]

class GetSearchRsp {
  GetSearchRsp({
      num? status, 
      List<Products>? products,}){
    _status = status;
    _products = products;
}

  GetSearchRsp.fromJson(dynamic json) {
    _status = json['status'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  num? _status;
  List<Products>? _products;
GetSearchRsp copyWith({  num? status,
  List<Products>? products,
}) => GetSearchRsp(  status: status ?? _status,
  products: products ?? _products,
);
  num? get status => _status;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// name : "Trà sữa nướng đen"
/// thumnail : "https://phuctea.com.vn/wp-content/uploads/2022/09/2c4d23a12669e237bb78-1-e1663577633193-768x706.jpg"
/// price : "20000"
/// id_category : "1"
/// created_at : null
/// updated_at : null

class Products {
  Products({
      String? id, 
      String? name, 
      String? thumnail, 
      String? price, 
      String? idCategory, 
      dynamic createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _name = name;
    _thumnail = thumnail;
    _price = price;
    _idCategory = idCategory;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _thumnail = json['thumnail'];
    _price = json['price'];
    _idCategory = json['id_category'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  String? _thumnail;
  String? _price;
  String? _idCategory;
  dynamic _createdAt;
  dynamic _updatedAt;
Products copyWith({  String? id,
  String? name,
  String? thumnail,
  String? price,
  String? idCategory,
  dynamic createdAt,
  dynamic updatedAt,
}) => Products(  id: id ?? _id,
  name: name ?? _name,
  thumnail: thumnail ?? _thumnail,
  price: price ?? _price,
  idCategory: idCategory ?? _idCategory,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get name => _name;
  String? get thumnail => _thumnail;
  String? get price => _price;
  String? get idCategory => _idCategory;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['thumnail'] = _thumnail;
    map['price'] = _price;
    map['id_category'] = _idCategory;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}