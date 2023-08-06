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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Tài khoản',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://static-images.vnncdn.net/files/publish/2023/7/5/mason-mount-ra-mat-mu-2-1273.jpg'),
                radius: 50,

              ),
              const SizedBox(height: 10,),
              Text('Quang Thiện',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),
              ),

            ],
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width*.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap:(){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100
                        ),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Thông tin cá nhân',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap:(){

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100
                        ),
                        child: ListTile(
                          leading: Icon(Icons.list_alt),
                          title: Text('Quản lí đơn hàng',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap:(){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100
                        ),
                        child: ListTile(
                          leading: Icon(Icons.favorite_outlined),
                          title: Text('Sản phẩm yêu thích',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:(){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100
                        ),
                        child: ListTile(
                          leading: Icon(Icons.headphones),
                          title: Text('Hỗ trợ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:()async{
                      await logicSignin.signOut();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100
                        ),
                        child: ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Đăng xuất',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),


                ],
              ),
            ),
          ),


          const SizedBox.shrink()
        ],
      ),
    );
  }
}
