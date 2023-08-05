/// status : 200
/// option_sugar : [{"id_sugar":"1","options":"0% Đường"},{"id_sugar":"2","options":"100% Đường"},{"id_sugar":"3","options":"300% Đường"},{"id_sugar":"4","options":"50% Đường"},{"id_sugar":"5","options":"70% Đường"}]

class GetSugarRsp {
  GetSugarRsp({
      num? status, 
      List<OptionSugar>? optionSugar,}){
    _status = status;
    _optionSugar = optionSugar;
}

  GetSugarRsp.fromJson(dynamic json) {
    _status = json['status'];
    if (json['option_sugar'] != null) {
      _optionSugar = [];
      json['option_sugar'].forEach((v) {
        _optionSugar?.add(OptionSugar.fromJson(v));
      });
    }
  }
  num? _status;
  List<OptionSugar>? _optionSugar;
GetSugarRsp copyWith({  num? status,
  List<OptionSugar>? optionSugar,
}) => GetSugarRsp(  status: status ?? _status,
  optionSugar: optionSugar ?? _optionSugar,
);
  num? get status => _status;
  List<OptionSugar>? get optionSugar => _optionSugar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_optionSugar != null) {
      map['option_sugar'] = _optionSugar?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id_sugar : "1"
/// options : "0% Đường"

class OptionSugar {
  OptionSugar({
      String? idSugar, 
      String? options,}){
    _idSugar = idSugar;
    _options = options;
}

  OptionSugar.fromJson(dynamic json) {
    _idSugar = json['id_sugar'];
    _options = json['options'];
  }
  String? _idSugar;
  String? _options;
OptionSugar copyWith({  String? idSugar,
  String? options,
}) => OptionSugar(  idSugar: idSugar ?? _idSugar,
  options: options ?? _options,
);
  String? get idSugar => _idSugar;
  String? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_sugar'] = _idSugar;
    map['options'] = _options;
    return map;
  }

}