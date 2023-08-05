import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_screen_logic.dart';

class Splash_screenPage extends StatelessWidget {
  const Splash_screenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Splash_screenLogic());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/icons/haha_logo.png"),


          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 300,),
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Color(0xffffa386),
                strokeWidth: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
