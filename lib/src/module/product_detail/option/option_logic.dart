import 'dart:convert';

import 'package:fake_store/src/data/repositories/get_stone_rsp.dart';
import 'package:get/get.dart';

import '../../../data/repositories/get_sugar_rsp.dart';
import '../../../data/repositories/get_topping_rsp.dart';
import '../../../data/services/service.dart';

class OptionLogic extends GetxController {
  final  Services  services ;
  OptionLogic(this.services);
  Rx<int> numProd = Rx(1);
  Rxn<num> selectStone = Rxn();
  Rxn<num>selectSugar = Rxn();
  RxList isSelected = RxList();
  RxList selectTopping = RxList();
  RxList listTopping = RxList();
  // RxList<bool>listBool = RxList();

  Rxn<GetStoneRsp>getStoneRsp=Rxn();
  Rxn<GetSugarRsp>getSugarRsp=Rxn();
  Rxn<GetToppingRsp>getToppingRSp=Rxn();


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getStone();
    getSugar();
    getTopping();


  }

  Future<GetStoneRsp?>getStone()async{
    getStoneRsp.value = await services.getStoneRsp();

    return getStoneRsp.value;
  }

  Future<GetSugarRsp?>getSugar()async{
    getSugarRsp.value = await services.getSugarRsp();

    return getSugarRsp.value;
  }

  Future<GetToppingRsp?>getTopping()async{
    getToppingRSp.value = await services.getToppingRsp();
    return getToppingRSp.value;
  }

  // Future fecthData()async{
  //   for(var i = 0; i< num.parse(getToppingRSp.value?.topping?.length.toString()??'');i++){
  //     var data = getToppingRSp.value?.topping?[i];
  //     listTopping.value= [
  //       {
  //         "id":data?.idTopping,
  //         "name":data?.nameTopping,
  //         "isSelect":false
  //
  //       }
  //
  //
  //     ];
  //
  //
  //
  //   }
  //   return listTopping.value;
  //
  // }

}
