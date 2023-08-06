import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_logic.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(NotificationLogic());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Thông báo',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width*.95,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network("https://chinmilktea.vn/public/upload/images/thumb_baiviet/0103---0703-thu-ngay-mon-moi---mien-phi-ngoc-trai-71615607662.jpg"),
                        title: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 8),
                          child: Text('Hàng gì cũng nhận, ở đâu cũng giao mà giá chỉ 15k'),
                        ),
                        subtitle: Text('10 phút'),
                      )
                    ],
                  ),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
              return Container(height: 2,color: Colors.grey.shade100,width: MediaQuery.of(context).size.width,);
          },
          )
        ],
      ),
    );
  }
}
