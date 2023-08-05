import 'package:fake_store/src/data/repositories/get_topping_rsp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'option_logic.dart';

class OptionPage extends StatelessWidget {
  final String name;
  final String price;
  final String thumbnail;

  const OptionPage(
      {Key? key, required this.name, required this.price, required this.thumbnail})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(OptionLogic(Get.find()));

    return Scaffold(
      // extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.close, color: Colors.black, size: 20,)),
        title: Text('Thêm món',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery
                .of(context)
                .size
                .height * .2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {

                    },
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            thumbnail,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .3,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              Text(
                                NumberFormat
                                    .simpleCurrency(
                                    locale:
                                    'vi')
                                    .format(double.parse(price))
                                ,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.6

                                ),
                                // maxLines: 3,
                              )
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    color: Colors.grey.shade100,
                    height: 10,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                  ),
                ),
              ],
            )
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ghi chú thêm tùy chọn (nếu có)',

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: Colors.grey.shade100,
                  height: 10,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Tùy chọn đá',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: logic.getStoneRsp.value?.optionStone?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(logic.getStoneRsp.value?.optionStone?[index]
                                .options ?? ""),
                            Obx(() {
                              return Radio(
                                  value: int.parse(logic.getStoneRsp.value
                                      ?.optionStone?[index].idStone??''),
                                  groupValue: logic.selectStone.value,
                                  onChanged: (value) {
                                    logic.selectStone.value = value;
                                  },
                                  activeColor: Colors.red
                              );
                            }),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 1,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            color: Colors.grey.shade200,
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Tùy chọn đường',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: logic.getSugarRsp.value?.optionSugar?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(logic.getSugarRsp.value?.optionSugar?[index]
                                .options ?? ""),
                            Obx(() {
                              return Radio(
                                  value: int.parse(logic.getSugarRsp.value
                                      ?.optionSugar?[index].idSugar??''),
                                  groupValue: logic.selectSugar.value,
                                  onChanged: (value) {
                                    logic.selectSugar.value = value;
                                  },
                                  activeColor: Colors.red
                              );
                            }),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 1,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            color: Colors.grey.shade200,
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Topping',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: logic.getToppingRSp.value?.topping?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(logic.getToppingRSp.value?.topping?[index]
                                .nameTopping ?? ""),
                            // Obx(() {
                            //   return Checkbox(
                            //       value: logic.getToppingRSp.value?.topping?[index].idTopping,
                            //       onChanged: (value) {
                            //
                            //       },
                            //       activeColor: Colors.red
                            //   );
                            // }),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 1,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            color: Colors.grey.shade200,
                          ),
                        );
                      },
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 20),
                    //   child: Text('Topping',
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    // ),


                  ],
                ),
              ),


            ],

          ),
        );
      }),

      bottomNavigationBar: BottomAppBar(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: logic.numProd.value > 1,
                  replacement: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.shade300
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.remove, color: Colors.grey.shade300,),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      logic.numProd.value -= 1;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade300
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ),
                ),
                Text(logic.numProd.toString() ?? ""),
                InkWell(
                  onTap: () {
                    logic.numProd.value += 1;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.shade300
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.add),
                    ),
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
                        print(">>>>>>>>>>>>>>>>>>>>>>${logic.listTopping}");
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text('Thêm ${NumberFormat.currency(locale: "vi")
                            .format(int.parse(price) * logic.numProd.value)}',
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
          );
        }),
      ),
    );
  }
}
