import 'package:fake_store/src/module/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/get_product_category_rsp.dart';
import '../home/home_logic.dart';
import '../order/order_view.dart';
import '../product_detail/product_detail_view.dart';
import 'cart_logic.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(CartLogic(Get.find()));
    final logicHome = Get.put(HomeLogic(Get.find()));

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
            IconButton(
                onPressed: () {
                  Get.to(SearchPage());
                }, icon: Icon(Icons.search, color: Colors.black,)
            )
          ],
          elevation: 0.5,
          title: Text(
            'Giỏ hàng',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          if (logic.getCartRsp.value?.data?.isEmpty ?? true) {
            if (logic.getCartRsp.value?.status == 400) {
              return Center(
                child: Text("không có sản phẩm trong giỏ hàng",
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              );

            }
            else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Color(0xffffa386),
                ),
              );
            }
          }
          return ListView(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: logic.getCartRsp.value?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .85,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.grey.shade200)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  logic.getCartRsp.value?.data?[index]
                                      .thumbnail ?? "",
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * .3,

                                ),
                              ),
                              const SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      logic.getCartRsp.value?.data?[index]
                                          .name ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Text(
                                      "Giá gốc: ${NumberFormat.simpleCurrency(
                                          locale: 'vi')
                                          .format(double.parse(
                                          logic.getCartRsp.value?.data?[index]
                                              .cost.toString() ?? ""))}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.5
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Text(
                                      "Tạm tính: ${NumberFormat.simpleCurrency(
                                          locale: 'vi')
                                          .format(double.parse(
                                          logic.getCartRsp.value?.data?[index]
                                              .currentPrice.toString() ??
                                              ""))}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.5,
                                          color: Colors.red
                                      ),
                                    ),
                                    const SizedBox(height: 30,),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () async{
                                            if(logic.getCartRsp.value?.data?[index].quantity=="1"){
                                              Get.dialog(
                                                  AlertDialog(
                                                    title: Text("Bạn có muốn xóa sản phẩm này ?",
                                                      style: TextStyle(
                                                        fontSize: 14,

                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: (){
                                                          Get.back();
                                                        }, child: Text("Không",
                                                        style: TextStyle(
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                        style: ElevatedButton.styleFrom(
                                                            primary: Colors.white
                                                        ),
                                                      ),
                                                      ElevatedButton(

                                                        onPressed: ()async{
                                                          Get.back();
                                                          await logic.updateCart(
                                                              id: logic.getCartRsp.value?.data?[index].id??"",
                                                              type: "x");

                                                        }, child: Text("Đồng ý"),
                                                        style: ElevatedButton.styleFrom(
                                                            primary: Color(0xffffa386)
                                                        ),
                                                      )
                                                    ],
                                                  )
                                              );
                                            }
                                            else{
                                              await logic.updateCart(
                                                  id: logic.getCartRsp.value?.data?[index].id??"",
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
                                              padding: const EdgeInsets.all(
                                                  5),
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              logic.getCartRsp.value
                                                  ?.data?[index]
                                                  .quantity.toString() ?? ""),
                                        ),
                                        InkWell(
                                          onTap: () async{
                                            await logic.updateCart(
                                                id: logic.getCartRsp.value?.data?[index].id??"",
                                                type: "+"
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey.shade300
                                                ),
                                                borderRadius: BorderRadius
                                                    .circular(5)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 50,),
                                        IconButton(
                                            onPressed: () async{
                                              Get.dialog(
                                                AlertDialog(
                                                  title: Text("Bạn có muốn xóa sản phẩm này ?",
                                                  style: TextStyle(
                                                    fontSize: 14,

                                                  ),
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: (){
                                                          Get.back();
                                                        }, child: Text("Không",
                                                    style: TextStyle(
                                                      color: Colors.black
                                                    ),
                                                    ),
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.white
                                                      ),
                                                    ),
                                                    ElevatedButton(

                                                        onPressed: ()async{
                                                          Get.back();
                                                          await logic.updateCart(
                                                              id: logic.getCartRsp.value?.data?[index].id??"",
                                                              type: "x");

                                                        }, child: Text("Đồng ý"),
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Color(0xffffa386)
                                                      ),
                                                    )
                                                  ],
                                                )
                                              );

                                            },
                                            icon: Icon(Icons.delete,
                                              color: Color(0xffffa386),
                                              size: 30,)
                                        )
                                      ],
                                    )
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
          );
        }),
        bottomNavigationBar: BottomAppBar(
            child: Obx(() {
              return Visibility(
                visible: logic.getCartRsp.value?.data?.isEmpty ?? true,
                child: Text(''),
                replacement: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Tổng: ${logic.getCartRsp.value?.total} ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                primary: Color(0xffffa386)
                            ),
                            onPressed: () {
                              Get.to(OrderPage(),transition: Transition.rightToLeft);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text('Mua hàng',
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
              );
            })
        )
    );
  }
}
