import 'package:fake_store/src/module/authentication/otp/otp_view.dart';
import 'package:fake_store/src/module/authentication/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import 'package:firebase_ui_auth/firebase_ui_auth.dart' as ui;
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart' as uifb;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart' as uigg;

import 'sign_in_logic.dart';

class Sign_inPage extends StatelessWidget {
  const Sign_inPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Sign_inLogic(Get.find()));

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Center(child: SvgPicture.asset("assets/icons/login.svg",
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .4,
            )),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Đăng nhập",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Obx(() {
            return Form(
              key: logic.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: logic.phoneController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập số điện thoại';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Nhập số điện thoại',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.phone, color: Color(0xffffa386),),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300
                          ),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300
                          ),
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: logic.hiddenPassword.value ?? true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        logic.passController.text = value ?? "";
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: Visibility(
                          visible: logic.hiddenPassword.value == true,
                          replacement: IconButton(
                            onPressed: () {
                              logic.hiddenPassword.value = true;
                            },
                            icon: Icon(
                                Icons.visibility, color: Color(0xffffa386)),
                          ),
                          child: IconButton(
                            onPressed: () {
                              logic.hiddenPassword.value = false;
                            },
                            icon: Icon(Icons.visibility_off,
                                color: Color(0xffffa386)),
                          ),
                        ),
                        hintText: 'Nhập mật khẩu',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.lock, color: Color(0xffffa386),),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300
                          ),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300
                          ),
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: ElevatedButton(
                        onPressed: () async {
                          if(logic.phoneController.text.isEmpty && logic.passController.text.isEmpty){
                            Get.snackbar('Thông báo', 'Vui lòng nhập thông tin');
                          }
                          else{
                            await logic.signIn();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            primary: Color(0xffffa386)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 2,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .4,
                  color: Colors.grey.shade200,
                ),
              ),
              Text("Hoặc",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 2,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .4,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          ui.AuthStateListener(
            listener: (oldState, state, controller) {
              if (state is ui.UserCreated) {
                logic.socialSignin(state.credential.user,);
              }
              if (state is ui.SignedIn) {
                logic.socialSignin(state.user,);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [

                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .95,

                    child: ui.OAuthProviderButton(
                      provider: uigg.GoogleProvider(
                          clientId: '858282805262-u2qgaph89igk449kh246hepitc3f37qj.apps.googleusercontent.com'),
                    ),
                  ),

                  // Container(
                  //   width: MediaQuery.of(context).size.width*.95,
                  //   child: ui.OAuthProviderButton(
                  //     provider: uifb.FacebookProvider(clientId: '277551901591822', redirectUri: 'https://gas-luxen.firebaseapp.com/__/auth/handler'),
                  //   ),
                  // ),


                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bạn chưa có tài khoản ?"),
              const SizedBox(width: 3),
              TextButton(
                  onPressed: () {
                    Get.to(SignupPage());
                  }, child: Text('Đăng ký',
                style: TextStyle(
                    color: Color(0xffffa386)
                ),
              )
              )
            ],
          ),

        ],
      ),
    );
  }
}
