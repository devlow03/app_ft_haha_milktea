import 'dart:convert';

import 'package:fake_store/src/data/repositories/post_login_rsqt_bodies.dart';
import 'package:fake_store/src/data/repositories/post_register_rqst.dart';
import 'package:fake_store/src/data/repositories/post_social_register_rqst.dart';
import 'package:fake_store/src/module/authentication/otp/otp_logic.dart';
import 'package:fake_store/src/module/authentication/otp/otp_view.dart';
import 'package:fake_store/src/module/index/index_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/services/service.dart';
import '../../home/home_logic.dart';

class Sign_inLogic extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final logic = Get.put(HomeLogic(Get.find()));
  final  Services  services ;
  Sign_inLogic(this.services);
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneControl = TextEditingController();
  Rxn<String>verifyId = Rxn();
  Rxn<bool>signUp = Rxn(false);
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    await socialSignin;

  }
  Future sendOTP()async{
    if(phoneControl.text.isEmpty){
      Get.snackbar('Thông báo', 'Vui lòng nhập số điện thoại');
    }
    else{
      await auth.verifyPhoneNumber(
        phoneNumber: "+84${phoneControl.text}",
        verificationCompleted: (PhoneAuthCredential credential)async{
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e){
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code
          verifyId.value = verificationId;

        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
      Get.to(const OtpPage());
    }
  }


  Future socialSignin(User? user)async{
    await services.postSocialRegister(body: PostSocialRegisterRqst(
      name: user?.displayName,
      email: user?.email,
      password: user?.uid,
      social: 'Google',
      avatar: '1',


    )).then((value)async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", value.accessToken??"");
      print("token: >>>>>>>>>>>${prefs.getString("token")}");
      print(jsonEncode(value));
      await logic.getBanner();
      await logic.getCategory();
      await logic.getProductCategory();
      Fluttertoast.showToast(
          msg: "Đăng nhập thành công", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
      Get.offAll(IndexPage());
    });

    print("uid: >>>>>>>>>>>>>>>>>>>>>${user?.uid}");







  }
  Future signOut()async{
    await auth.signOut();
    await services.postLogout();
  }

}
