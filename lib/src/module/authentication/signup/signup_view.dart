import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../otp/otp_view.dart';
import 'signup_logic.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SignupLogic(Get.find()));

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Center(child: SvgPicture.asset("assets/icons/enter_number.svg",

            )),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Nhập Số Điện Thoại",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Form(
            key: logic.formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    autovalidateMode:AutovalidateMode.onUserInteraction,
                    controller: logic.phoneControl,
                    keyboardType: TextInputType.number,
                    // validator:(value){
                    //   logic.phoneControl.text = value??'';
                    //   if(logic.phoneControl.text==''){
                    //     return "Vui lòng nhập số điện thoại";
                    //   }
                    //   return null;
                    //
                    // },
                    decoration: InputDecoration(
                      hintText: 'Số điện thoại',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.phone,color: Color(0xffffa386),),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
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
                      enabledBorder:  OutlineInputBorder(
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
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        await logic.sendOTP();
                        // Get.to(OtpPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Gửi mã xác thực",
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
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              Get.back();
              Get.back();
            },
            child: Center(
                child: Text("Trở về")),
          ),
          const SizedBox(height: 10,),


        ],
      ),
    );
  }
}
