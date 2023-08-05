import 'package:fake_store/src/module/search/search_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class SearchSuggest extends StatelessWidget {
   SearchSuggest({Key? key}) : super(key: key);
  final logic = Get.put(SearchLogic(Get.find()));
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Row(
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
                        .format(logic.getSearchRsp.value?.products?[index].price)
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
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 25,
        );
      },
    );
  }
}
