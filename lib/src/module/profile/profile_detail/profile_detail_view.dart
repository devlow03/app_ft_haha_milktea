import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/get_profile_rsp.dart';
import '../../splash_screen/splash_screen_logic.dart';
import 'profile_detail_logic.dart';

class Profile_detailPage extends StatelessWidget {
  final Data? data;
  const Profile_detailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Profile_detailLogic());
    final logicSplash = Get.put(Splash_screenLogic());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Get.to(SearchPage());
          //     }, icon: Icon(Icons.search, color: Colors.black,)
          // )
        ],
        elevation: 0.5,
        title: Text(
          'Thông tin cá nhân',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 5,),
          Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                   data?.avatar??"",
                  ),
                  radius: 35,
                  backgroundColor: Colors.white,
                  // child: Image.asset(
                  //   ("resources/images/Item_camera.png"),
                  // ),
                ),
                // ),
              ),
              TextButton(
                  onPressed: () async {
                    // showPhotoOptions();
                  },
                  child: Text(
                    "Đổi ảnh đại diện",
                    style: TextStyle(color: Colors.blue),
                  )),
              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Id",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                              data?.id.toString()??"",
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Họ tên',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                              data?.name??"",
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Email',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                              data?.email??"",
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   padding: EdgeInsets.all(15),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       // border: Border.all(color: Colors.grey.shade500),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: Row(
                      //     mainAxisAlignment:
                      //     MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Expanded(
                      //         child: Text(
                      //           'Ngày sinh',
                      //           style: TextStyle(fontSize: 15),
                      //         ),
                      //       ),
                      //       Text(
                      //         '13/03/2002',
                      //         // overflow: TextOverflow.ellipsis,
                      //         // maxLines: 1,
                      //         style: TextStyle(fontSize: 15),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Tỉnh / Thành phố',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                              data?.city??"",
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Quận / Huyện',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                                data?.district??"",
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Phường / Xã',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                                data?.street??"",
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Số điện thoại',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                              data?.phone??"",
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),


                      //don't delete

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .55,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {

                          },
                          child: Text('Thay đổi thông tin'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              primary: Colors.blue.shade700),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width * .55,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {

                          },
                          child: Text('Xóa tài khoản'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              primary: Colors.red),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
