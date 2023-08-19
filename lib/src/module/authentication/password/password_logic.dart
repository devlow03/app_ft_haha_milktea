import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repositories/post_login_rsqt_bodies.dart';
import '../../../data/repositories/post_register_rqst.dart';
import '../../../data/services/service.dart';
import '../../home/home_logic.dart';
import '../../index/index_view.dart';
import '../../splash_screen/splash_screen_logic.dart';
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
  final logicSplash = Get.put(Splash_screenLogic());

  Future registerWithPhone()async{
    Get.dialog( Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 5,
            color: Color(0xffffa386),

          ),
          const SizedBox(height: 20,),
          Text("Hệ thống đang xử lí",
            style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                decoration: TextDecoration.none
            ),
          )
        ],
      ),
    ));
    try{
      await services.postRegisterRsp(body: PostRegisterRqst(
        phone:logic.phoneNumber.value,
        password: passController.text,
        passwordConfirmation: passController.text,
        city: logicSplash.city.value,
        district: logicSplash.district.value,
        street: logicSplash.street.value
      ));
      await signIn(password: passController.text,phone: logic.phoneNumber.value??'');
      await logicHome.getBanner();
      await logicHome.getCategory();
      await logicHome.getProductCategory();
      Get.snackbar(
          "Thông báo mới",
          "Đăng ký tài khoản thành công"
      );
      Get.offAll(IndexPage());

    }catch(e){
      Get.back();
      Get.snackbar(
          "Đăng ký tài khoản không thành công",
          "Vui lòng thử lại"
      );
    }
  }

  Future signIn({required String password, required String phone})async{
    await services.postLoginRsp(body: PostLoginRsqtBodies(
        password: password,
        phone: phone,
    )).then((value)async{

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", value.accessToken??"");
      await prefs.setString("uid",value.uid??"");
    });
  }
}
