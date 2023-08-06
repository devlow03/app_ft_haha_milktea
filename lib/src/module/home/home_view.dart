import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_store/src/data/repositories/get_product_category_rsp.dart';
import 'package:fake_store/src/module/product_detail/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/global_product.dart';
import '../../widget/search_widget.dart';
import '../splash_screen/splash_screen_logic.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic(Get.find()));
    final logicSplash = Get.put(Splash_screenLogic());
    return Scaffold(
      // backgroundColor:Color(0xffFFE7CC),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SearchWiget()
        ),
        elevation: 0.0,
        backgroundColor: Color(0xffFFE7CC),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(

              children: [
                Icon(Icons.location_on,color: Colors.pink,size: 20,),
                Text("${logicSplash.street.value}, ${logicSplash.district.value}, ${logicSplash.city.value}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  ),
                ),
                Icon(Icons.keyboard_arrow_right_outlined,color: Colors.black,)
              ],
            ),
            // Image.asset("assets/icons/HAHA.png",
            // ),
            Icon(Icons.menu,color: Colors.black,)


          ],
        ),
        actions: [
          // Icon(Icons.location_on),

        ],

      ),
      body: Obx(() {
        if((logic.getBannerRsp.value?.banner?.length??0)<0){
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: Color(0xffffa386),

            ),
          );
        }
        return RefreshIndicator(
         color:Color(0xffffa386),
          onRefresh: () async {
            logic.refresh();
          },
          child: ListView(
            children: [

              const SizedBox(
                height: 10,
              ),
              CarouselSlider.builder(
                itemCount: logic.getBannerRsp.value?.banner?.length ?? 0,
                options: CarouselOptions(
                  aspectRatio: 25 / 12,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 7),
                  // enlargeCenterPage: true,

                  onPageChanged: (index, reason) {
                    logic.activeIndex.value = index;
                  },

                  // viewportFraction: 1,
                ),
                itemBuilder: (context, index, realIndex) {
                  return Visibility(
                    visible: logic.getBannerRsp.value?.banner?.length != null,
                    replacement: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            logic.getBannerRsp.value?.banner?[index].name ?? '',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10,),
              Center(
                // bottom: 2,
                  child: AnimatedSmoothIndicator(
                    count: logic.getBannerRsp.value?.banner?.length??0,
                    activeIndex: logic.activeIndex.value ?? 0,
                    effect: ScrollingDotsEffect(
                        dotWidth: 10,
                        dotHeight: 5,
                        dotColor: Colors.grey,
                        activeDotColor: Color(0xfff8aa91),
                    ),
                  )),
              const SizedBox(
                height: 5,
              ),
              // Container(
              //   height: 10,
              //   width: MediaQuery.of(context).size.width,
              //   color: Colors.grey.shade200,
              //
              // ),
              // const SizedBox(height: 10,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, ind) {
                    // logic.id.value =
                    //     logic.getCategoryRsp.value?.category?[index].idCategory;
                    logic.getProductCategory(
                        id: logic.getCategoryRsp.value?.categories?[ind].id);
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width*.9,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                  Color(0xfff8aa91),
                                  Color(0xffffe7cc)
                                ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  logic.getCategoryRsp.value?.categories?[ind]
                                          .name ??
                                      '',
                                  style: TextStyle(
                                      color: Colors.brown.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder<GetProductCategoryRsp?>(
                            future: logic.getProductCategory(
                                id: logic.getCategoryRsp.value
                                    ?.categories?[ind].id),
                            builder: (context, snapshot) {
                              return SizedBox(
                                height: 250,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Visibility(
                                        visible:
                                            snapshot.data?.products?.length !=
                                                null,
                                        replacement: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Icon(
                                            Icons.image,
                                            size: 100,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              Get.to(Product_detailPage(
                                                  id: logic.getCategoryRsp.value?.categories?[ind].id,
                                                  thumbnail: snapshot.data?.products?[index]
                                                    .thumnail??'',
                                                  name: snapshot.data?.products?[index]
                                                      .name??'',
                                                price: snapshot.data?.products?[index]
                                                    .price.toString()??'',
                                                // description: snapshot.data?.products?[index]
                                                //     .descript??'',
                                                category: snapshot.data?.products?[index]
                                                    .idCategory.toString()??'',
                                              ),

                                              );
                                            },
                                            child: GlobalProduct(
                                              imageLink:  snapshot
                                                  .data
                                                  ?.products?[
                                              index]
                                                  .thumnail ??
                                                  '',
                                              nameProduct:  snapshot
                                                  .data
                                                  ?.products?[
                                              index]
                                                  .name ??
                                                  '',
                                              price:  double.parse(snapshot
                                                  .data
                                                  ?.products?[
                                              index]
                                                  .price ??
                                                  '')
                                            )
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width: 10,
                                      );
                                    },
                                    itemCount:
                                        snapshot.data?.products?.length ?? 0),
                              );

                            })
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Center();
                  },
                  itemCount:
                      logic.getCategoryRsp.value?.categories?.length ?? 0),
              const SizedBox(height: 30,)
            ],
          ),
        );
      }),
    );
  }
}
