import 'package:fake_store/src/module/cart/cart_view.dart';
import 'package:fake_store/src/module/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:retrofit/http.dart';
import '../../data/repositories/get_product_category_rsp.dart';
import '../../data/repositories/get_product_rsp.dart';
import '../home/home_logic.dart';
import 'option/option_logic.dart';
import 'option/option_view.dart';
import 'product_detail_logic.dart';

class Product_detailPage extends StatelessWidget {
  final String id;
  final String idProd;
  final String name;
  final String price;
  final String thumbnail;


  Product_detailPage({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.idProd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Product_detailLogic(Get.find()));
    final logicHome = Get.put(HomeLogic(Get.find()));
    final logicOption = Get.put(OptionLogic(Get.find()));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black38,

                    ),
                    child: Icon(Icons.arrow_back))

            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark
            ),
            expandedHeight: MediaQuery.of(context).size.height*.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(thumbnail,
              fit: BoxFit.cover,
              ),
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
            pinned: true,
            stretch: true,
            actions: [
              IconButton(
                  onPressed: (){
                    Fluttertoast.showToast(
                        msg: "Đã thêm sản phẩm vào yêu thích", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.white, fontSize: 16.0);
                  },
                  icon: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38,

                      ),
                      child: Icon(Icons.favorite_border))

              ),
              IconButton(
                  onPressed: (){
                    Get.to(SearchPage());
                  },
                  icon: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38,

                      ),
                      child: Icon(Icons.search))

              ),
              IconButton(
                onPressed: (){
                  Get.to(CartPage(),transition: Transition.rightToLeft);
                },
                  icon: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38,

                      ),
                      child: Icon(Icons.shopping_bag_outlined))
              ),
            ],

            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(0.0),
            //   child: Container(
            //     height: 32,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20)
            //       )
            //     ),
            //     child: Container(
            //       width: 40,
            //       height: 5,
            //       decoration: BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(100)
            //       ),
            //     ),
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${name} - 1 ly",
                              style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              NumberFormat
                                  .simpleCurrency(
                                  locale:
                                  'vi')
                                  .format(int.parse(price)),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.orange,),
                          const SizedBox(width: 5,),
                          Text(
                            '4.5/5 (50 đánh giá)',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {

                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height*.7,
                                    child: OptionPage(
                                      idCategory: id,
                                        id: idProd,
                                        name: name,
                                        price: price,
                                        thumbnail: thumbnail,
                                    )
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "CHỌN MUA",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              primary: Color(0xffffa386)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  color: Colors.grey.shade100,
                ),
                const SizedBox(height: 10,),

                FutureBuilder<GetProductCategoryRsp?>(
                    future: logicHome.getProductCategory(
                        id: id),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric( horizontal: 15,vertical: 5),
                              child: Row(
                                children: [
                                  Text('SẢN PHẨM CÙNG LOẠI',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric( horizontal: 15),

                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data?.products?.length??0,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Get.back();
                                      Get.to(Product_detailPage(
                                          id: id,
                                          idProd: idProd,
                                          name: snapshot.data?.products?[index].name??'',
                                          price: snapshot.data?.products?[index].price.toString()??'',
                                          thumbnail: snapshot.data?.products?[index].thumnail??''));
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(6),
                                          child: Image.network(
                                            snapshot.data?.products?[index].thumnail??'',
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
                                                snapshot.data?.products?[index].name??'',
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
                                                    .format(double.parse(snapshot.data?.products?[index].price??''))
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
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 25,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Color(0xffffa386),
                        ),
                      );


                    }),

                const SizedBox(height: 20,),
              ],
            ),
          )
        ],
      )

    );
  }
}
