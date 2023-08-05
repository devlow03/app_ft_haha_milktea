import 'package:fake_store/src/module/news/news_view.dart';
import 'package:fake_store/src/module/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import 'index_logic.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(IndexLogic());

    List<Map<String, dynamic>> bottomNavigationBarItems = [
      {
        'icon': SvgPicture.asset('assets/icons/house-light.svg',
        width: 30,
          height: 30,
        ),
        'active':SvgPicture.asset('assets/icons/house-bold.svg',
          width: 30,
          height: 30,
        ),
        'label': 'Trang chủ',
        'screen': HomePage(),
      },
      {
        'icon': SvgPicture.asset('assets/icons/notification-light.svg',
          width: 30,
          height: 30,
        ),
        'active':SvgPicture.asset('assets/icons/notification-bold.svg',
          width: 30,
          height: 30,
        ),
        'label': 'Thông báo',
        'screen': NewsPage(),
      },
      {
        'icon': SvgPicture.asset('assets/icons/user-light.svg',
          width: 30,
          height: 30,
        ),
        'active':SvgPicture.asset('assets/icons/user-bold.svg',
          width: 30,
          height: 30,
        ),
        'label': 'Tài khoản',
        'screen': ProfilePage(),
      },
    ];
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          // selectedLabelStyle: TextStyle(fontSize: 0),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
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
