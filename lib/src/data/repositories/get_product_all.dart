class GetProductAll {
  GetProductAll({
      int? id, 
      String? title, 
      double? price, 
      String? description, 
      String? category, 
      String? image, 
      Rating? rating,}){
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _category = category;
    _image = image;
    _rating = rating;
}

  GetProductAll.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _category = json['category'];
    _image = json['image'];
    _rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
  int? _id;
  String? _title;
  double? _price;
  String? _description;
  String? _category;
  String? _image;
  Rating? _rating;
GetProductAll copyWith({  int? id,
  String? title,
  double? price,
  String? description,
  String? category,
  String? image,
  Rating? rating,
}) => GetProductAll(  id: id ?? _id,
  title: title ?? _title,
  price: price ?? _price,
  description: description ?? _description,
  category: category ?? _category,
  image: image ?? _image,
  rating: rating ?? _rating,
);
  int? get id => _id;
  String? get title => _title;
  double? get price => _price;
  String? get description => _description;
  String? get category => _category;
  String? get image => _image;
  Rating? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    map['category'] = _category;
    map['image'] = _image;
    if (_rating != null) {
      map['rating'] = _rating?.toJson();
    }
    return map;
  }

}

class Rating {
  Rating({
      double? rate, 
      int? count,}){
    _rate = rate;
    _count = count;
}

  Rating.fromJson(dynamic json) {
    _rate = json['rate'];
    _count = json['count'];
  }
  double? _rate;
  int? _count;
Rating copyWith({  double? rate,
  int? count,
}) => Rating(  rate: rate ?? _rate,
  count: count ?? _count,
);
  double? get rate => _rate;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = _rate;
    map['count'] = _count;
    return map;
  }

}