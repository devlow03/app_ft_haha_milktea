import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'password_logic.dart';

class PasswordPage extends StatelessWidget {


  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PasswordLogic(Get.find()));
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(child: SvgPicture.asset("assets/icons/password.svg",
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .53,
              )),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Thiết lập mật khẩu",
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
                        obscureText: logic.hiddenPassword.value??true,
                        autovalidateMode:AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          logic.passController.text = value??"";
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
                      child: TextFormField(
                        autovalidateMode:AutovalidateMode.onUserInteraction,
                        obscureText: logic.hiddenRePassword.value ?? true,
                        controller: logic.rePassController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value?.isEmpty??true) {
                            return 'Vui lòng xác nhận mật khẩu';
                          } else if (value != logic.passController.text) {
                            return 'Mật khẩu không khớp';
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                          suffixIcon: Visibility(
                            visible: logic.hiddenRePassword.value == true,
                            replacement: IconButton(
                              onPressed: () {
                                logic.hiddenRePassword.value = true;
                              },
                              icon: Icon(
                                  Icons.visibility, color: Color(0xffffa386)),
                            ),
                            child: IconButton(
                              onPressed: () {
                                logic.hiddenRePassword.value = false;
                              },
                              icon: Icon(Icons.visibility_off,
                                  color: Color(0xffffa386)),
                            ),
                          ),
                          hintText: 'Nhập lại mật khẩu',
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
                            if(logic.passController.text.isEmpty){
                              Get.snackbar('Thông báo', 'Vui lòng nhập mật khẩu');
                            }
                            else{
                              await logic.registerWithPhone();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Xác nhận",
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
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Center(
                  child: Text("Trở về")),
            ),
            const SizedBox(height: 10,),


          ],
        )
    );
  }
}
