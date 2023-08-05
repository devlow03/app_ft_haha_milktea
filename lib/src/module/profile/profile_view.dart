import 'package:fake_store/src/module/authentication/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/sign_in/sign_in_logic.dart';
import 'profile_logic.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final logic = Get.put(ProfileLogic());

  @override
  Widget build(BuildContext context) {
    final logicSignin = Get.put(Sign_inLogic(Get.find()));
    return Center(
      child: TextButton(
          onPressed: ()async{
            await logicSignin.signOut();
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            Fluttertoast.showToast(
                msg: "Đăng xuất thành công", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
            // print(await prefs.get("uuid"));
            Get.offAll(Sign_inPage());
          },
          child: Text("Đăng xuất")),
    );
  }
}
