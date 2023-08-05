import 'package:fake_store/src/module/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalProduct extends StatefulWidget {
  final String? imageLink;
  final String? nameProduct;
  final dynamic price;
  final String? numStar;
  final String? shortDes;

  // final String? shortDescript;
  const GlobalProduct({
    Key? key,
    this.imageLink,
    this.nameProduct,
    this.price,
    this.shortDes,
    this.numStar,
    // this.shortDescript


  }) : super(key: key);


  @override
  State<GlobalProduct> createState() => _GlobalProductState();
}

class _GlobalProductState extends State<GlobalProduct> {


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic(Get.find()));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
                color: Colors.grey.shade200
            )
          // Color(0xffE0E5EC),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade50,
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: Offset(0, 2), // changes position of shadow
          //   ),
          // ],
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 160,
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                          5),
                      child: Image.network(
                        widget.imageLink ?? '',
                        width: MediaQuery
                            .of(
                            context)
                            .size
                            .width *
                            .35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.nameProduct ??
                        '',
                    textAlign:
                    TextAlign.center,
                    maxLines: 2,
                    overflow:
                    TextOverflow.ellipsis,
                    style: TextStyle(
                        height: 1,

                        // fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    NumberFormat
                        .simpleCurrency(
                        locale:
                        'vi')
                        .format(widget.price ??
                        0),
                    style: TextStyle(
                        fontSize: 16,
                        color:
                        Colors.black,
                        letterSpacing:
                        0.5,
                        fontWeight:
                        FontWeight
                            .w300),
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .start,


                    children: [
                      Icon(Icons.star, color: Colors.orangeAccent, size: 20,),
                      const SizedBox(width: 3,),
                      Text(
                        '4.5/5(100+)',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                        ),
                      ),

                      // const SizedBox(width: 60,),
                      // Container(
                      //     padding:
                      //     EdgeInsets.all(5),
                      //     decoration: BoxDecoration(
                      //         shape: BoxShape
                      //             .circle,
                      //         color: Color(
                      //             0xffFFE7CC)),
                      //     child: Image.asset(
                      //       'assets/icons/cart_icon.png',
                      //       width: 25,
                      //       height: 25,
                      //     ))
                    ],
                  ),
                )
              ],
            ),
            // Obx(() {
            //   return Positioned(
            //     top: 140,
            //     left: MediaQuery
            //         .of(context)
            //         .size
            //         .width * .29,
            //     child: Container(
            //       padding:
            //       EdgeInsets.all(7),
            //       decoration:
            //       BoxDecoration(
            //           shape: BoxShape
            //               .circle,
            //           color: Color(
            //               0xffF8AA91)),
            //       child: Visibility(
            //         visible: logic.onFavorite.value == true,
            //         replacement: InkWell(
            //           onTap: () {
            //             logic.onFavorite.value = true;
            //           },
            //           child: Icon(
            //             Icons
            //                 .favorite_border_outlined,
            //             size: 20,
            //
            //           ),
            //         ),
            //         child: InkWell(
            //           onTap: () {
            //             logic.onFavorite.value = false;
            //           },
            //           child: Icon(
            //             Icons
            //                 .favorite_outlined,
            //             size: 20,
            //             color: Colors.red,
            //           ),
            //         ),
            //       ),
            //     ),
            //   );
            // })
          ],
        ),
      ),
    );
  }
}
