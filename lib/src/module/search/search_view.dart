import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widget/global_product.dart';
import '../product_detail/product_detail_view.dart';
import 'search_logic.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SearchLogic(Get.find()));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Get.back();
          },
        ),
        actions: null,
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: logic.nameControl,
            onTap: () {
              Get.to(SearchPage());
            },
            onChanged: (value) {
              logic.onSearch.value = false;
              logic.name = value;
              logic.getSearch(name: logic.name);
            },
            decoration: InputDecoration(
              hintText: 'Tìm sản phẩm',
              // suffixIcon: InkWell(
              //     onTap: () {
              //       logic.onSearch.value = true;
              //       logic.getSearch(name: logic.name);
              //     },
              //     child: Icon(Icons.search, color: Colors.black, size: 30,)),
              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Colors.transparent
                ),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Colors.transparent
                ),
              ),
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Colors.transparent
                ),
              ),

            ),
          ),
        ),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 10,),
          Obx(() {
            return Visibility(
              visible: logic.onSearch == true,
              replacement: Column(
                children: [

                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        logic.itemCount = logic.getSearchRsp.value?.products?.length;
                        if(logic.itemCount==null){
                          return Center();
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Get.to(Product_detailPage(
                                id:  logic.getSearchRsp.value?.products?[index].id.toString(),
                                name:  logic.getSearchRsp.value?.products?[index].name??'',
                                price: logic.getSearchRsp.value?.products?[index].price.toString()??'',
                                // description: logic.getSearchRsp.value?.products?[ind].descript??'',
                                category:  logic.getSearchRsp.value?.products?[index].idCategory.toString()??'',
                                thumbnail: logic.getSearchRsp.value?.products?[index].thumnail.toString()??''));

                            },
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    logic.getSearchRsp.value?.products?[index].thumnail??'',
                                    width: MediaQuery.of(context).size.width * .33,
                                    fit: BoxFit.cover,
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
                                        logic.getSearchRsp.value?.products?[index].name??'',
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
                                            .format(double.parse(logic.getSearchRsp.value?.products?[index].price??""))
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
                                )
                              ],
                            )
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10,);
                      },
                      itemCount: logic.itemCount!=0?5:1
                  ),
                  const SizedBox(height: 5,),
                  Visibility(
                    visible: logic.getSearchRsp.value?.products?.length!=null,
                    child: TextButton(
                        onPressed: (){
                          logic.onSearch.value=true;

                        }, child: Text('Xem thêm sản phẩm',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ),
                    )),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Từ khóa tìm kiếm: ${logic.name}'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 290),
                        itemCount: logic.getSearchRsp.value?.products?.length??0,
                        itemBuilder: (context, ind) {
                          return InkWell(
                            onTap: () {
                              Get.to(Product_detailPage(
                                  id:  logic.getSearchRsp.value?.products?[ind].id.toString(),
                              name:  logic.getSearchRsp.value?.products?[ind].name??'',
                                price: logic.getSearchRsp.value?.products?[ind].price.toString()??'',
                                // description: logic.getSearchRsp.value?.products?[ind].descript??'',
                                category:  logic.getSearchRsp.value?.products?[ind].idCategory.toString()??'',
                                thumbnail: logic.getSearchRsp.value?.products?[ind].thumnail.toString()??'',
                              ),


                              );
                            },
                            child: GlobalProduct(
                              nameProduct: logic.getSearchRsp.value
                                  ?.products?[ind].name,
                              imageLink: logic.getSearchRsp.value
                                  ?.products?[ind].thumnail,
                              price: double.parse(logic.getSearchRsp.value
                                  ?.products?[ind].price??'')
                                  ,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
