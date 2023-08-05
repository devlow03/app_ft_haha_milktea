import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_logic.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final logic = Get.put(NewsLogic());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
