import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/repositories/get_search_rsp.dart';
import '../../data/services/service.dart';

class SearchLogic extends GetxController {
  final  Services  services ;
  Rxn<GetSearchRsp>getSearchRsp = Rxn();
  Rxn<bool>  onSearch = Rxn();
  SearchLogic(this.services);
  TextEditingController nameControl = TextEditingController();
  String? name;
  int? itemCount;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getSearch;
  }

  Future<GetSearchRsp?>getSearch({required  name})async{
    getSearchRsp.value = await services.getSearchRsp(name: nameControl.text);
    print(jsonEncode(getSearchRsp.value));
    return getSearchRsp.value;

  }
}
