/// status : 200
/// banner : [{"id":"2","name":"https://phuctea.com.vn/wp-content/uploads/2022/09/cover-MIEN-BAC-01-2048x779.png","created_at":null,"updated_at":null},{"id":"3","name":"https://phuctea.com.vn/wp-content/uploads/2022/04/tran-chau-hoang-kim-2048x779.jpg","created_at":null,"updated_at":null},{"id":"4","name":"https://phuctea.com.vn/wp-content/uploads/2020/11/banner-best-seller-02-2048x785.jpg","created_at":null,"updated_at":null},{"id":"5","name":"https://phuctea.com.vn/wp-content/uploads/2020/11/banner-best-seller-01-2048x785.jpg","created_at":null,"updated_at":null}]

class GetBannerRsp {
  GetBannerRsp({
      num? status, 
      List<Banner>? banner,}){
    _status = status;
    _banner = banner;
}

  GetBannerRsp.fromJson(dynamic json) {
    _status = json['status'];
    if (json['banner'] != null) {
      _banner = [];
      json['banner'].forEach((v) {
        _banner?.add(Banner.fromJson(v));
      });
    }
  }
  num? _status;
  List<Banner>? _banner;
GetBannerRsp copyWith({  num? status,
  List<Banner>? banner,
}) => GetBannerRsp(  status: status ?? _status,
  banner: banner ?? _banner,
);
  num? get status => _status;
  List<Banner>? get banner => _banner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_banner != null) {
      map['banner'] = _banner?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// name : "https://phuctea.com.vn/wp-content/uploads/2022/09/cover-MIEN-BAC-01-2048x779.png"
/// created_at : null
/// updated_at : null

class Banner {
  Banner({
      String? id, 
      String? name, 
      dynamic createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Banner.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  dynamic _createdAt;
  dynamic _updatedAt;
Banner copyWith({  String? id,
  String? name,
  dynamic createdAt,
  dynamic updatedAt,
}) => Banner(  id: id ?? _id,
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