import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/view/widgets/carousal_padding.dart';
import 'package:pixel_gear/screen/Home/view/widgets/category_items.dart';
import 'package:pixel_gear/screen/Home/view/widgets/drawerWidget.dart';
import 'package:pixel_gear/screen/Home/view/widgets/home_grid.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({
    super.key,
  });

  final homeconntroller = Get.put(HomeController());
  // final images = [
  //   'https://assetscdn1.paytm.com/images/catalog/view_item/599013/1614322892185.jpg?imwidth=1600&impolicy=hq',
  //   'https://www.shopickr.com/wp-content/uploads/2016/06/amazon-india-dslr-camera-best-discounts-offers-coupons.jpg',
  //   'https://i0.wp.com/pixelpluck.com/wp-content/uploads/2017/02/Nikon-D810-and-D750-buy-back-offer-1.jpg?fit=585%2C332&ssl=1'
  // ];

  final gridList = [
    'https://i.pinimg.com/564x/19/b5/56/19b55664ac790e0b9c0a2c701abb90a8.jpg',
    'https://i.pinimg.com/564x/ee/e8/65/eee865cf4b4cf1da1511fe642ed3695d.jpg',
    'https://i.pinimg.com/564x/61/4c/39/614c3919c6e83974c4f1d456afe74174.jpg',
    'https://s.studiobinder.com/wp-content/uploads/2021/06/Best-Canon-Camera-Lenses-Canon-EF-24-70mm-f2.8L-II-USM.png',
    'https://m.media-amazon.com/images/I/81+DVd3syvL._SL1300_.jpg',
    'https://i.gadgets360cdn.com/products/cameras/large/1548234727_832_canon_eos-3000d-18-0mp-dslr-camera.jpg',
    'https://heyjimmy.in/wp-content/uploads/2022/09/VSGO-DKL-15B-Camera-Lens-Cleaning-Kit-Travel-Edition-Blue-Online-Buy-Mumbai-India.jpg',
    'https://m.media-amazon.com/images/I/71oXkSlPrzL._SX522_.jpg',
    'https://m.media-amazon.com/images/I/61rqipwHOAL._SX522_.jpg',
    'https://m.media-amazon.com/images/I/41a-cOKhPkL._SX522_.jpg',
  ];
  final List<String> gridNames = [
    'Film cameras',
    'Mirrorless Cameras',
    'Tripods',
    'Camera lenses',
    'Camera bags',
    'DSLR cameras',
    'Camera cleaners',
    'Camera lights',
    'Go pro',
    'Security cameras',
  ];

  double height = Get.size.height;
  double width = Get.size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .25,
        backgroundColor: Colors.grey.shade900,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     color: kblackcolor,
        //   ),
        //   onPressed: () => Scaffold.of(context).openDrawer(),
        // ),
        title: Text(
          'P I X E L  G E A R',
          style: GoogleFonts.openSans(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: kwhitecolor,
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: GetBuilder<HomeController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              CarousalPadding(
                height: height,
                homeconntroller: homeconntroller,
                width: width,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              CategoryWidget(
                homeController: homeconntroller,
                height: height,
              ),
              kheight05,
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Top selling products',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              kheight05,
              HomeGrid(
                  height: height,
                  width: width,
                  gridList: gridList,
                  gridNames: gridNames),
            ],
          ),
        ),
      ),
    );
  }
}
