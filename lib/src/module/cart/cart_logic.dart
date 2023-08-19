import 'package:fake_store/src/data/repositories/put_update_cart_rqst.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/get_cart_rsp.dart';
import '../../data/services/service.dart';

class CartLogic extends GetxController {
  final  Services  services ;
  CartLogic(this.services);
  Rxn<GetCartRsp>getCartRsp = Rxn();

  @override
  void onReady() async{
    // TODO: implement onReady
    await getCart();
    super.onReady();
  }

  @override
  refresh()async{
    super.refresh();
    await getCart();
  }

  Future<GetCartRsp?>getCart()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    getCartRsp.value = await services.getCartRsp(uid: prefs.getString('uid')??'');
    return getCartRsp.value;
  }

  Future updateCart({required String id, required String type})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Get.dialog( Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 5,
            color: Color(0xffffa386),

          ),
          const SizedBox(height: 20,),
          Text("Đang tải",
            style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                decoration: TextDecoration.none
            ),
          )
        ],
      ),
    ));
    await services.putUpdateCart(body: PutUpdateCartRqst(
      uid: prefs.getString('uid')??"",
      id: id,
      type: type

    ));
    Get.back();

    await getCart();
    if(type=="x"){

      Fluttertoast.showToast(
          msg: "Xóa sản phẩm khỏi giỏ hàng thành công", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);


    }


  }
}
