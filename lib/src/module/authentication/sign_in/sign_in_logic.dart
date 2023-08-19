import 'dart:convert';

import 'package:fake_store/src/data/repositories/post_login_rsqt_bodies.dart';
import 'package:fake_store/src/data/repositories/post_register_rqst.dart';
import 'package:fake_store/src/data/repositories/post_social_register_rqst.dart';
import 'package:fake_store/src/module/authentication/otp/otp_logic.dart';
import 'package:fake_store/src/module/authentication/otp/otp_view.dart';
import 'package:fake_store/src/module/authentication/sign_in/sign_in_view.dart';
import 'package:fake_store/src/module/index/index_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/services/service.dart';
import '../../home/home_logic.dart';
import '../../splash_screen/splash_screen_logic.dart';

class Sign_inLogic extends GetxController {
  final logicSplash = Get.put(Splash_screenLogic());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final logic = Get.put(HomeLogic(Get.find()));
  final  Services  services ;
  Sign_inLogic(this.services);
  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<bool>hiddenPassword = Rxn(true);
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    await socialSignin;

  }



  Future socialSignin(User? user)async{
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
      await services.postSocialRegister(body: PostSocialRegisterRqst(
        name: user?.displayName,
        email: user?.email,
        password: user?.uid,
        social: 'Google',
        avatar: user?.photoURL,
        city: logicSplash.city.value,
        district: logicSplash.district.value,
        street: logicSplash.street.value


      )).then((value)async{
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${user?.uid}");
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", value.accessToken??"");
        await prefs.setString("uid",value.uid??"");
        print("token: >>>>>>>>>>>${prefs.getString("token")}");
        print(jsonEncode(value));
        await logic.getBanner();
        await logic.getCategory();
        await logic.getProductCategory();
        Fluttertoast.showToast(
            msg: "Đăng nhập thành công", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
        Get.offAll(IndexPage());
      });
    }catch(e){
      await signOut();
      Get.back();
      Get.snackbar("Đăng nhập không thành công", "Vui lòng thử lại");
    }


    print("uid: >>>>>>>>>>>>>>>>>>>>>${user?.uid}");

  }


  Future signIn()async{
    Get.dialog( Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
        color: Color(0xffffa386),

      ),
    ));
    try{
      await services.postLoginRsp(body: PostLoginRsqtBodies(
        password: passController.text,
        phone: "+84${phoneController.text}",
      )).then((value)async{

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", value.accessToken??"");
        await prefs.setString("uid",value.uid??"");
        Fluttertoast.showToast(
            msg: "Đăng nhập thành công", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
        Get.offAll(IndexPage());

      });
    }catch(e){
      Get.back();
      Get.snackbar("Đăng nhập không thành công", "Vui lòng kiểm tra lại số điện thoại và mật khẩu");
    }




  }



  Future signOut()async{
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

      await auth.signOut();
      await services.postLogout();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    Fluttertoast.showToast(
        msg: "Đăng xuất thành công", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
    // print(await prefs.get("uuid"));
    Get.offAll(Sign_inPage());
    }catch(e){
      Get.back();
      Get.snackbar("Đăng xuất không thành công", "Vui lòng thử lại");
    }
  }

}
