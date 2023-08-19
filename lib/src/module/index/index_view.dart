import 'package:fake_store/src/module/notification/notification_view.dart';
import 'package:fake_store/src/module/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../cart/cart_view.dart';
import '../home/home_view.dart';
import 'index_logic.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(IndexLogic());

    List<Map<String, dynamic>> bottomNavigationBarItems = [
      {
        'icon': Icon(Icons.home),
        'active':Icon(Icons.home),
        'label': 'Trang chủ',
        'screen': HomePage(),
      },
      {
        'icon': Icon(Icons.favorite_border_outlined),
        'active':Icon(Icons.favorite),
        'label': 'Yêu thích',
        'screen': Text(''),
      },
      {
        'icon':Icon(Icons.notifications_active_outlined),
        'active':Icon(Icons.notifications_active),
        'label': 'Thông báo',
        'screen': NotificationPage(),
      },

    ];
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          // unselectedItemColor: Colors.grey,
          // showUnselectedLabels: false,
          // selectedLabelStyle: TextStyle(fontSize: 0),
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xffffa386),
          elevation: 0.0,
          showSelectedLabels: true,
          onTap: logic.tabSelect,
          currentIndex: logic.tabIndex.value,
          items: bottomNavigationBarItems.map((e) {
            return BottomNavigationBarItem(
              icon: e['icon'],
              activeIcon: e['active'],
              label: e['label'],

            );
          }).toList(),
        ),
        body: bottomNavigationBarItems[logic.tabIndex.value]['screen'],
      );
    });
  }
}
