// import 'package:get/get.dart';
//
// import '../module/home/home_logic.dart';
// import '../module/product_detail/product_detail_view.dart';
// import 'global_product.dart';
// import 'package:flutter/material.dart';
//
// class GridProduct extends StatelessWidget {
//   GridProduct({Key? key, this.idCategory} ) : super(key: key);
//
//   int? idCategory;
//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.put(HomeLogic(Get.find()));
//     return Obx(() {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 mainAxisExtent: 280),
//             itemCount: logic.getProductCategoryRsp.value?.prodCategory
//                 ?.length ?? 0,
//             itemBuilder: (context, ind) {
//               return InkWell(
//                 onTap: () {
//                   Get.to(Product_detailPage(
//                       id: logic.getAllProductRsp.value?.prod?[ind].id
//                           .toString() ?? ''));
//                 },
//                 child: GlobalProduct(
//                   nameProduct: logic.getProductCategoryRsp.value
//                       ?.prodCategory?[ind]
//                       .name,
//                   imageLink: logic.getProductCategoryRsp.value
//                       ?.prodCategory?[ind]
//                       .imgLink,
//                   price: logic.getProductCategoryRsp.value?.prodCategory?[ind]
//                       .price
//                       .toString(),
//
//
//                 ),
//               );
//             }),
//       );
//     });
//   }
// }
