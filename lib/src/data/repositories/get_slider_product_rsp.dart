class GetSliderProductRsp {
  GetSliderProductRsp({
      List<Slider>? slider,}){
    _slider = slider;
}

  GetSliderProductRsp.fromJson(dynamic json) {
    if (json['slider'] != null) {
      _slider = [];
      json['slider'].forEach((v) {
        _slider?.add(Slider.fromJson(v));
      });
    }
  }
  List<Slider>? _slider;
GetSliderProductRsp copyWith({  List<Slider>? slider,
}) => GetSliderProductRsp(  slider: slider ?? _slider,
);
  List<Slider>? get slider => _slider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_slider != null) {
      map['slider'] = _slider?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Slider {
  Slider({
      int? idSlider, 
      String? linkImg, 
      int? id,}){
    _idSlider = idSlider;
    _linkImg = linkImg;
    _id = id;
}

  Slider.fromJson(dynamic json) {
    _idSlider = json['id_slider'];
    _linkImg = json['link_img'];
    _id = json['id'];
  }
  int? _idSlider;
  String? _linkImg;
  int? _id;
Slider copyWith({  int? idSlider,
  String? linkImg,
  int? id,
}) => Slider(  idSlider: idSlider ?? _idSlider,
  linkImg: linkImg ?? _linkImg,
  id: id ?? _id,
);
  int? get idSlider => _idSlider;
  String? get linkImg => _linkImg;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_slider'] = _idSlider;
    map['link_img'] = _linkImg;
    map['id'] = _id;
    return map;
  }

}