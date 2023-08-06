import 'dart:convert';
import 'package:fake_store/src/module/index/index_view.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/sign_in/sign_in_view.dart';
import '../home/home_logic.dart';

class Splash_screenLogic extends GetxController {
  final logic = Get.put(HomeLogic(Get.find()));
  Rxn<Position> position = Rxn();
  RxList<Placemark>place = RxList();
  Rxn<String> street = Rxn();
  Rxn<String> apartmentNumber = Rxn();
  Rxn<String>district = Rxn();
  Rxn<String>city = Rxn();

  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    // Get.offAll(IndexPage());
    await checkUser();



  }

  Future getCurrentLocation()async{
    position.value = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    await placemarkFromCoordinates(position.value?.latitude??0, position.value?.longitude??0).then((value){
      street.value = value[1].street;
      district.value = value[1].subAdministrativeArea;
      city.value = value[1].administrativeArea;
    });

    print(jsonEncode(street.value));
  }

  Future checkUser()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.get('token')!=null){


      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      await getCurrentLocation();
      Get.offAll(IndexPage());
    }
    else{
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      await getCurrentLocation();
      Get.offAll(Sign_inPage());


    }
  }

}
