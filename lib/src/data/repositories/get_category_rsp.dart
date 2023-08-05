/// status : 200
/// categories : [{"id":"1","name":"TRÀ SỮA","created_at":null,"updated_at":null},{"id":"2","name":"TRÀ TRÁI CÂY","created_at":null,"updated_at":null},{"id":"3","name":"SOCOLA","created_at":null,"updated_at":null}]

class GetCategoryRsp {
  GetCategoryRsp({
      num? status, 
      List<Categories>? categories,}){
    _status = status;
    _categories = categories;
}

  GetCategoryRsp.fromJson(dynamic json) {
    _status = json['status'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }
  num? _status;
  List<Categories>? _categories;
GetCategoryRsp copyWith({  num? status,
  List<Categories>? categories,
}) => GetCategoryRsp(  status: status ?? _status,
  categories: categories ?? _categories,
);
  num? get status => _status;
  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// name : "TRÀ SỮA"
/// created_at : null
/// updated_at : null

class Categories {
  Categories({
      String? id, 
      String? name, 
      dynamic createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  dynamic _createdAt;
  dynamic _updatedAt;
Categories copyWith({  String? id,
  String? name,
  dynamic createdAt,
  dynamic updatedAt,
}) => Categories(  id: id ?? _id,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get name => _name;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}