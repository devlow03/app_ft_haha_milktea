import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/get_profile_rsp.dart';
import '../../data/services/service.dart';

class ProfileLogic extends GetxController {
  final  Services  services ;
  ProfileLogic(this.services);
  Rxn<GetProfileRsp> getProfileRsp = Rxn();

  @override
  void onReady()async{
    super.onReady();
    await getProfile();
  }

  Future<GetProfileRsp?>getProfile()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    getProfileRsp.value = await services.getProfileRsp(uid: prefs.getString('uid')??'');
    return getProfileRsp.value;
  }


}
