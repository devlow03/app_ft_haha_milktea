import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repositories/post_login_rsqt_bodies.dart';
import '../../../data/repositories/post_register_rqst.dart';
import '../../../data/services/service.dart';
import '../../home/home_logic.dart';
import '../../index/index_view.dart';
import '../otp/otp_logic.dart';

class PasswordLogic extends GetxController {
  final  Services  services ;
  final logic = Get.put(OtpLogic(Get.find()));
  PasswordLogic(this.services);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rxn<bool>hiddenPassword = Rxn(true);
  Rxn<bool>hiddenRePassword = Rxn(true);
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
  final logicHome = Get.put(HomeLogic(Get.find()));


  Future registerWithPhone()async{
    try{
      await services.postRegisterRsp(body: PostRegisterRqst(
        phone:logic.phoneNumber.value,
        password: passController.text,
        email: "'",
        passwordConfirmation: passController.text,
      ));
      await signIn(password: passController.text);
      await logicHome.getBanner();
      await logicHome.getCategory();
      await logicHome.getProductCategory();
      Get.snackbar(
          "Thông báo mới",
          "Đăng nhập tài khoản thành công"
      );
      Get.offAll(IndexPage());

    }catch(e){
      await signIn(password: passController.text);
      await logicHome.getBanner();
      await logicHome.getCategory();
      await logicHome.getProductCategory();
      Get.snackbar(
          "Thông báo mới",
          "Đăng nhập tài khoản thành công"
      );
      Get.offAll(IndexPage());
    }



  }

  Future signIn({required String password})async{
    await services.postLoginRsp(body: PostLoginRsqtBodies(
        email: "'",
        password: password,

    )).then((value)async{

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", value.accessToken??"");
    });
  }
}
