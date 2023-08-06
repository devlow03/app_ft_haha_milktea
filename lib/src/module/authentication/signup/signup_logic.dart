import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/service.dart';
import '../../home/home_logic.dart';
import '../otp/otp_view.dart';

class SignupLogic extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final logic = Get.put(HomeLogic(Get.find()));
  final  Services  services ;
  SignupLogic(this.services);
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneControl = TextEditingController();
  Rxn<String>verifyId = Rxn();
  Rxn<bool>signUp = Rxn(false);
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();

  }
  Future sendOTP()async{
    if(phoneControl.text.isEmpty){
      Get.snackbar('Thông báo', 'Vui lòng nhập số điện thoại');
    }
    else{
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
        Get.to(OtpPage(phoneNumber: phoneControl.text,));
      }catch(e){
        Get.back();
        Get.snackbar("Gửi mã xác thực thất bại","Vui lòng thử lại");
      }
    }
  }




}
