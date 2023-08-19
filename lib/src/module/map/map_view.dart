import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../splash_screen/splash_screen_logic.dart';
import 'map_logic.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MapLogic());
    final logicSplash = Get.put(Splash_screenLogic());

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Bản đồ",
        style: TextStyle(
          color:Colors.black
        ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,)

        ),
      ),
      body:GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(logicSplash.position.value?.latitude??0,logicSplash.position.value?.longitude??0),
          zoom: 16,


        ),
        markers: {
          Marker(
            markerId: MarkerId('current'),
            position: LatLng(logicSplash.position.value?.latitude??0,logicSplash.position.value?.longitude??0),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
            draggable: true
          )
        },
      )
    );
  }
}
