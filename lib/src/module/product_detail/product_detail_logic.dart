import 'dart:convert';

import 'package:fake_store/src/module/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/get_slider_product_rsp.dart';
import '../../data/repositories/post_card_rqst.dart';
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



}
