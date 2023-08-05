import 'package:fake_store/src/data/dependency_injections.dart';
import 'package:fake_store/src/module/index/index_view.dart';
import 'package:fake_store/src/module/splash_screen/splash_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'src/module/home/home_view.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjections().dependencies();
  await Firebase.initializeApp(
    // name: Platform.isIOS ? null : 'gas-luxen',
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fake Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffffa386),
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(color: Colors.red)
        )
      ),
      home:  Splash_screenPage(),
    );
  }
}


