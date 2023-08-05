import 'dart:convert';

import 'package:get/get.dart';

import '../../data/repositories/get_slider_product_rsp.dart';
import '../../data/services/service.dart';
import 'option/option_logic.dart';

class Product_detailLogic extends GetxController {
  final  Services  services ;
   int? id;
  Rxn<GetSliderProductRsp>getSliderProductRsp = Rxn();
  Product_detailLogic(this.services);
  final logicOption = Get.put(OptionLogic(Get.find()));


  @override
  onReady() async{
    // TODO: implement onReady
    super.onReady();
    await logicOption.getStone();
    await logicOption.getSugarRsp();
    await logicOption.getTopping();
  }

  // Future<GetSliderProductRsp?>getSliderProduct({required int id})async{
  //
  //    getSliderProductRsp.value = await services.getSliderProductRsp(id: id??0);
  //    print(jsonEncode(getSliderProductRsp.value));
  //
  //    return  getSliderProductRsp.value;
  // }

}
