/// status : 200
/// option_stone : [{"id_stone":"1","options":"Không đá"},{"id_stone":"2","options":"Nhiều Đá"},{"id_stone":"3","options":"Thức uống không đá, đầy ly"},{"id_stone":"4","options":"Ít đá"},{"id_stone":"5","options":"Đá bình thường"},{"id_stone":"6","options":"Đá riêng"}]

class GetStoneRsp {
  GetStoneRsp({
      num? status, 
      List<OptionStone>? optionStone,}){
    _status = status;
    _optionStone = optionStone;
}

  GetStoneRsp.fromJson(dynamic json) {
    _status = json['status'];
    if (json['option_stone'] != null) {
      _optionStone = [];
      json['option_stone'].forEach((v) {
        _optionStone?.add(OptionStone.fromJson(v));
      });
    }
  }
  num? _status;
  List<OptionStone>? _optionStone;
GetStoneRsp copyWith({  num? status,
  List<OptionStone>? optionStone,
}) => GetStoneRsp(  status: status ?? _status,
  optionStone: optionStone ?? _optionStone,
);
  num? get status => _status;
  List<OptionStone>? get optionStone => _optionStone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_optionStone != null) {
      map['option_stone'] = _optionStone?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id_stone : "1"
/// options : "Không đá"

class OptionStone {
  OptionStone({
      String? idStone, 
      String? options,}){
    _idStone = idStone;
    _options = options;
}

  OptionStone.fromJson(dynamic json) {
    _idStone = json['id_stone'];
    _options = json['options'];
  }
  String? _idStone;
  String? _options;
OptionStone copyWith({  String? idStone,
  String? options,
}) => OptionStone(  idStone: idStone ?? _idStone,
  options: options ?? _options,
);
  String? get idStone => _idStone;
  String? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_stone'] = _idStone;
    map['options'] = _options;
    return map;
  }

}