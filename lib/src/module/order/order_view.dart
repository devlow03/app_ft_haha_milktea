import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../cart/cart_logic.dart';
import '../search/search_view.dart';
import '../splash_screen/splash_screen_logic.dart';
import 'order_logic.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(OrderLogic());
    final logicSplash = Get.put(Splash_screenLogic());
    final logicCart = Get.put(CartLogic(Get.find()));
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Đơn hàng của bạn',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView(
          children: [
            // Container(

            //   height: 10,
            //   color: Colors.grey.shade200,
            // ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("GIAO TỚI ĐỊA CHỈ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        Text("Đổi địa chỉ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.pink,),
                        // const SizedBox(width: 3,),
                        Text("${logicSplash.street.value}, ${logicSplash
                            .district.value}, ${logicSplash.city.value}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 1
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Ghi chú thêm tùy chọn (nếu có)',

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 10,
                color: Colors.grey.shade200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CHI TIẾT ĐƠN HÀNG",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: logicCart.getCartRsp.value?.data?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                // border: Border.all(color: Colors.grey.shade200)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        logicCart.getCartRsp.value?.data?[index]
                                            .thumbnail ?? "",
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * .2,

                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                logicCart.getCartRsp.value
                                                    ?.data?[index]
                                                    .name ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),

                                              Text(
                                                NumberFormat.simpleCurrency(
                                                    locale: 'vi').format(
                                                    double.parse(logicCart
                                                        .getCartRsp.value
                                                        ?.data?[index]
                                                        .currentPrice
                                                        .toString() ?? "")
                                                ), style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700
                                              ),
                                              )
                                            ],
                                          ),

                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  if (logicCart.getCartRsp.value
                                                      ?.data?[index].quantity ==
                                                      "1") {
                                                    Get.dialog(
                                                        AlertDialog(
                                                          title: Text(
                                                            "Bạn có muốn xóa sản phẩm này ?",
                                                            style: TextStyle(
                                                              fontSize: 14,

                                                            ),
                                                          ),
                                                          actions: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              child: Text(
                                                                "Không",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                ),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                  primary: Colors
                                                                      .white
                                                              ),
                                                            ),
                                                            ElevatedButton(

                                                              onPressed: () async {
                                                                Get.back();
                                                                await logicCart
                                                                    .updateCart(
                                                                    id: logicCart
                                                                        .getCartRsp
                                                                        .value
                                                                        ?.data?[index]
                                                                        .id ??
                                                                        "",
                                                                    type: "x");
                                                              },
                                                              child: Text(
                                                                  "Đồng ý"),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                  primary: Color(
                                                                      0xffffa386)
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    );
                                                  }
                                                  else {
                                                    await logicCart.updateCart(
                                                        id: logicCart.getCartRsp
                                                            .value?.data?[index]
                                                            .id ?? "",
                                                        type: "-"
                                                    );
                                                  }
                                                  // logic.numProd.value -= 1;
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey
                                                              .shade300
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .circular(5)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(
                                                        5),
                                                    child: Icon(Icons.remove),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    8.0),
                                                child: Text(
                                                    logicCart.getCartRsp.value
                                                        ?.data?[index]
                                                        .quantity.toString() ??
                                                        ""),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await logicCart.updateCart(
                                                      id: logicCart.getCartRsp
                                                          .value?.data?[index]
                                                          .id ?? "",
                                                      type: "+"
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey
                                                              .shade300
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .circular(5)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(5),
                                                    child: Icon(Icons.add),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 1,),
                                              TextButton(
                                                onPressed: () async {
                                                  Get.dialog(
                                                      AlertDialog(
                                                        title: Text(
                                                          "Bạn có muốn xóa sản phẩm này ?",
                                                          style: TextStyle(
                                                            fontSize: 14,

                                                          ),
                                                        ),
                                                        actions: [
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Text(
                                                              "Không",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                              ),
                                                            ),
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                primary: Colors
                                                                    .white
                                                            ),
                                                          ),
                                                          ElevatedButton(

                                                            onPressed: () async {
                                                              Get.back();
                                                              await logicCart
                                                                  .updateCart(
                                                                  id: logicCart
                                                                      .getCartRsp
                                                                      .value
                                                                      ?.data?[index]
                                                                      .id ??
                                                                      "",
                                                                  type: "x");
                                                            },
                                                            child: Text(
                                                                "Đồng ý"),
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                primary: Color(
                                                                    0xffffa386)
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                  );
                                                },
                                                child: Text("Xóa",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              )
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10,);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 10,
                color: Colors.grey.shade200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("PHƯƠNG THỨC THANH TOÁN",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        Text("Thay đổi",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.local_shipping),
                        const SizedBox(width: 3,),
                        Text("Thanh toán khi nhận hàng",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 1
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

          ],
        );
      }),
      bottomNavigationBar: BottomAppBar(
        child: Obx(() {
          return Container(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.hardEdge,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: const BorderRadius.only(
              //     topRight: Radius.circular(24),
              //     topLeft: Radius.circular(24)),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 5,
              //     blurRadius: 24,
              //     offset:
              //     const Offset(0, 2), // changes position of shadow
              //   ),
              // ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tổng:",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5
                        ),
                      ),
                      Text("${logicCart.getCartRsp.value?.total}")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .25,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                primary: Colors.white
                            ),
                            onPressed: () {
                              Get.to(OrderPage(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15),
                              child: Text('%|Mã giảm giá',
                                style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    color: Colors.black

                                ),
                              ),
                            )
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .65,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                primary: Color(0xffffa386)
                            ),
                            onPressed: () {
                              Get.to(OrderPage(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15),
                              child: Text('Đặt hàng',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,


                                ),
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
