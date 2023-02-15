import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/product/view/product.dart';

class HomeGrid extends GetView {
  HomeGrid({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  final apibaseUrl = ApiBaseUrl();
  final productC = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: productC.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.37,
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(ProductScreen(
                    height: height,
                    width: width,
                  ));
                },
                child: CustomCard(
                  elevation: 10,
                  child: SizedBox(
                    width: width * 0.5,
                    height: height * 0.1,
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.16,
                          width: width * 0.50,
                          decoration: BoxDecoration(
                            color: greycolor,
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${apibaseUrl.baseUrl}/products/${productC.productList[index].image[0]}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        kheight10,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 1),
                          child: Text(
                            productC.productList[index].description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ),
                        kheight10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "₹ ${productC.productList[index].price.toString()}",
                                  style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "${productC.productList[index].rating.toString()}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
