class GetProductRsp {
  GetProductRsp({
      List<Prod>? prod,}){
    _prod = prod;
}

  GetProductRsp.fromJson(dynamic json) {
    if (json['prod'] != null) {
      _prod = [];
      json['prod'].forEach((v) {
        _prod?.add(Prod.fromJson(v));
      });
    }
  }
  List<Prod>? _prod;
GetProductRsp copyWith({  List<Prod>? prod,
}) => GetProductRsp(  prod: prod ?? _prod,
);
  List<Prod>? get prod => _prod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_prod != null) {
      map['prod'] = _prod?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Prod {
  Prod({
      int? id, 
      int? idCategory, 
      int? featured, 
      String? imgLink, 
      String? name, 
      int? price, 
      String? shortDes, 
      String? descript, 
      int? favorite,}){
    _id = id;
    _idCategory = idCategory;
    _featured = featured;
    _imgLink = imgLink;
    _name = name;
    _price = price;
    _shortDes = shortDes;
    _descript = descript;
    _favorite = favorite;
}

  Prod.fromJson(dynamic json) {
    _id = json['id'];
    _idCategory = json['id_category'];
    _featured = json['featured'];
    _imgLink = json['img_link'];
    _name = json['name'];
    _price = json['price'];
    _shortDes = json['short_des'];
    _descript = json['descript'];
    _favorite = json['favorite'];
  }
  int? _id;
  int? _idCategory;
  int? _featured;
  String? _imgLink;
  String? _name;
  int? _price;
  String? _shortDes;
  String? _descript;
  int? _favorite;
Prod copyWith({  int? id,
  int? idCategory,
  int? featured,
  String? imgLink,
  String? name,
  int? price,
  String? shortDes,
  String? descript,
  int? favorite,
}) => Prod(  id: id ?? _id,
  idCategory: idCategory ?? _idCategory,
  featured: featured ?? _featured,
  imgLink: imgLink ?? _imgLink,
  name: name ?? _name,
  price: price ?? _price,
  shortDes: shortDes ?? _shortDes,
  descript: descript ?? _descript,
  favorite: favorite ?? _favorite,
);
  int? get id => _id;
  int? get idCategory => _idCategory;
  int? get featured => _featured;
  String? get imgLink => _imgLink;
  String? get name => _name;
  int? get price => _price;
  String? get shortDes => _shortDes;
  String? get descript => _descript;
  int? get favorite => _favorite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_category'] = _idCategory;
    map['featured'] = _featured;
    map['img_link'] = _imgLink;
    map['name'] = _name;
    map['price'] = _price;
    map['short_des'] = _shortDes;
    map['descript'] = _descript;
    map['favorite'] = _favorite;
    return map;
  }

}