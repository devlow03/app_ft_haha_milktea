import 'dart:convert';

import 'package:fake_store/src/data/repositories/get_banner_rsp.dart';
import 'package:fake_store/src/data/repositories/get_category_rsp.dart';
import 'package:fake_store/src/data/repositories/get_product_category_rsp.dart';
import 'package:fake_store/src/data/services/service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


import '../../data/repositories/get_product_rsp.dart';
import '../splash_screen/splash_screen_logic.dart';

class HomeLogic extends GetxController {
  final  Services  services ;
  Rxn<GetCategoryRsp>getCategoryRsp = Rxn();
  Rxn<GetProductCategoryRsp>getProductCategoryRsp = Rxn();
  Rxn<GetProductRsp>getAllProductRsp = Rxn();
  Rxn<GetBannerRsp>getBannerRsp=Rxn();
  Rxn<int> id = Rxn();
  Rxn<int> activeIndex = Rxn();
  Rxn<bool>onFavorite = Rxn();



  HomeLogic(this.services);

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
      getAllProduct();
      getCategory();
      getProductCategory();
      getBanner();
  }

  @override
  void refresh() async{
    // TODO: implement refresh
    super.refresh();
    await getBanner();
    await getCategory();
    await getProductCategory();


  }
  // onReady(){

  // }
  @override

  
  
  Future<GetProductRsp?>getAllProduct() async{

      getAllProductRsp.value = await services.getProduct();

      return getAllProductRsp.value;
  }

  Future<GetCategoryRsp?>getCategory()async{
    getCategoryRsp.value = await services.getCategoryRsp();

    return getCategoryRsp.value;
  }

  Future<GetProductCategoryRsp?>getProductCategory( {String? id})async{
    getProductCategoryRsp.value = await services.getProductCategory(id: id??'' );


    return getProductCategoryRsp.value;
  }

  Future<GetBannerRsp?>getBanner()async{
    getBannerRsp.value=await services.getBannerRsp();

    return getBannerRsp.value;
  }



}
