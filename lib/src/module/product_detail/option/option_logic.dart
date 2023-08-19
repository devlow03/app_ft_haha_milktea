import 'dart:convert';

import 'package:fake_store/src/data/repositories/get_stone_rsp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repositories/get_sugar_rsp.dart';
import '../../../data/repositories/get_topping_rsp.dart';
import '../../../data/repositories/post_card_rqst.dart';
import '../../../data/services/service.dart';
import '../../cart/cart_view.dart';

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

  Future createCart({
    required String idCategory,
    required String id,
    required String name,
    required String thumbnail,
    required String cost,
    required String currentPrice,
    required String quantity
  })async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try{
      await services.postCreateCart(body: PostCardRqst(
          uid: prefs.getString('uid'),
          idCategory: idCategory,
          id: id,
          name:name,
          thumbnail: thumbnail,
          cost: cost,
          currentPrice: currentPrice,
          quantity: quantity
      ));
      Fluttertoast.showToast(
          msg: "Thêm vào giỏ hàng thành công", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
      Get.to(CartPage(),transition: Transition.rightToLeft);
      numProd.value=1;
    }catch(e){
      Fluttertoast.showToast(
          msg: "Có lỗi xảy ra, vui lòng thử lại", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
    }


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
