import 'dart:convert';

import 'package:fake_store/src/data/repositories/post_login_rsqt_bodies.dart';
import 'package:fake_store/src/module/authentication/password/password_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repositories/post_register_rqst.dart';
import '../../../data/services/service.dart';
import '../../index/index_view.dart';
import '../sign_in/sign_in_logic.dart';

class OtpLogic extends GetxController {
  final  Services  services ;

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController codeControl = TextEditingController();
  final logic = Get.put(Sign_inLogic(Get.find()));
  Rxn<String>phoneNumber = Rxn();
  // Rxn<String>phoneNumber = Rxn();
  OtpLogic(this.services);


  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    // await verifyOtp();
  }

  Future verifyOtp()async {
    // await registerWithPhone(phone: '0776506112').then((value)async{
    //   await signIn(password: '123456');
    //   print(">>>>>>>>>>>>${1}");
    // });
    // Get.snackbar(
    //     "Thông báo mới",
    //     "Đăng nhập tài khoản thành công"
    // );
    if (codeControl.text.isEmpty) {
      Get.snackbar('Thông báo', 'Vui lòng nhập mã xác thực');
    }
    else {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
        verificationId: logic.verifyId.value ?? '',
        smsCode: codeControl.text,
      );
      await auth.signInWithCredential(credential).then((value) async {
        phoneNumber.value = value.user?.phoneNumber;
        Get.to(const PasswordPage());
      });
    }
  }






}
