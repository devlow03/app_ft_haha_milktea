import 'package:dio/dio.dart';
import 'package:fake_store/src/data/repositories/get_product_category_rsp.dart';
import 'package:fake_store/src/data/repositories/get_slider_product_rsp.dart';
import 'package:fake_store/src/data/repositories/get_stone_rsp.dart';
import 'package:fake_store/src/data/repositories/get_sugar_rsp.dart';
import 'package:fake_store/src/data/repositories/get_topping_rsp.dart';
import 'package:fake_store/src/data/repositories/post_login_rsp.dart';
import 'package:fake_store/src/data/repositories/post_login_rsqt_bodies.dart';
import 'package:fake_store/src/data/repositories/post_register_rqst.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart'as rtf;

import '../repositories/get_banner_rsp.dart';
import '../repositories/get_cart_rsp.dart';
import '../repositories/get_category_rsp.dart';
import '../repositories/get_product_all.dart';
import '../repositories/get_product_rsp.dart';
import '../repositories/get_profile_rsp.dart';
import '../repositories/get_search_rsp.dart';
import '../repositories/post_card_rqst.dart';
import '../repositories/post_social_register_rqst.dart';
import '../repositories/put_update_cart_rqst.dart';
part 'service.g.dart';
@rtf.RestApi(baseUrl:"http://hahatea.thiendev202.id.vn/api/")

abstract class Services{
  factory Services(Dio dio,{String baseUrl}) = _Services;

  @rtf.GET('v1/prod')
  Future<GetProductRsp> getProduct();
  @rtf.GET('v1/category')
  Future<GetCategoryRsp>getCategoryRsp();
  @rtf.GET('v1/products/{id}')
  Future<GetProductCategoryRsp>getProductCategory({@rtf.Path('id') required String id});
  @rtf.GET('v1/banner')
  Future<GetBannerRsp>getBannerRsp();
  @rtf.GET('v1/search/{name}')
  Future<GetSearchRsp>getSearchRsp({@rtf.Path('name') required String name});
  @rtf.GET('v1/option/stone')
  Future<GetStoneRsp>getStoneRsp();
  @rtf.GET('v1/option/sugar')
  Future<GetSugarRsp>getSugarRsp();
  @rtf.GET('v1/option/topping')
  Future<GetToppingRsp>getToppingRsp();
  @rtf.POST('auth/register')
  Future postRegisterRsp({@rtf.Body() required PostRegisterRqst body });
  @rtf.POST('auth/social')
  Future<PostLoginRsp>postSocialRegister({@rtf.Body() required PostSocialRegisterRqst body });
  @rtf.POST('auth/login')
  Future<PostLoginRsp>postLoginRsp({@rtf.Body() required PostLoginRsqtBodies body});
  @rtf.POST('v1/logout')
  Future postLogout();
  @rtf.POST('v1/products/cart')
  Future postCreateCart({@rtf.Body() required PostCardRqst body});
  @rtf.GET('v1/products/cart/{uid}')
  Future<GetCartRsp>getCartRsp({@rtf.Path('uid') required String uid});
  @rtf.PUT('v1/products/cart/update')
  Future putUpdateCart({@rtf.Body() required PutUpdateCartRqst body });
  @rtf.GET('v1/profile/{uid}')
  Future<GetProfileRsp>getProfileRsp({@rtf.Path('uid') required String uid});





}
