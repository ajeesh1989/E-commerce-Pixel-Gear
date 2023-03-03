import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Address/widget/add_address.dart';
import 'package:pixel_gear/screen/Ordersummary/controller/ordersummaryControll.dart';
import 'package:pixel_gear/screen/Ordersummary/view/oderssummary.dart';
import '../EditAddress/view/edit_address.dart';
import 'controller/address_controller.dart';

class MyAddress extends StatelessWidget {
  MyAddress({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  final accountC = Get.put(AcountController());
  final orderSummerC = Get.put(OrderCOntrollerSummery());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kblackcolor,
            )),
        elevation: 0,
        backgroundColor: kwhitecolor,
        centerTitle: true,
        title: const Text(
          'All address',
          style: TextStyle(color: kblackcolor),
        ),
        actions: [
          accountC.addressList.isEmpty
              ? const Text('')
              : IconButton(
                  onPressed: () {
                    Get.to(
                      () => AddAddressPage(
                        width: width,
                        height: height,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: kblackcolor,
                  ),
                )
        ],
      ),
      body: SafeArea(
        child: GetBuilder<AcountController>(
          builder: (controller) {
            return accountC.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: kwhitecolor,
                      backgroundColor: Colors.grey.shade900,
                    ),
                  )
                : accountC.addressList.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'lib/images/no address.png',
                              scale: .80,
                              fit: BoxFit.fill,
                            ),
                            const Text(
                              'No Address found!!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'We were unable to find a valid address. Please add a new address and also ensure that the address you provided is correct and complete, including the street name, number, city, state/province, and postal code. ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 15),
                              ),
                            ),
                            kheight10,
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(width * 0.4, height * 0.05),
                                backgroundColor: Colors.grey.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                              onPressed: () {
                                Get.to(
                                  () => AddAddressPage(
                                    width: width,
                                    height: height,
                                  ),
                                );
                              },
                              child: const Text(
                                'Add a new address',
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                orderSummerC.indexChange(index);
                                accountC.changeinde(index);
                                Get.to(() => OrderSummery(page: 0));
                              },
                              child: Container(
                                width: double.infinity,
                                height: height * 0.258,
                                decoration: BoxDecoration(
                                    color: orderSummerC.index == index
                                        ? Colors.blueGrey[50]
                                        : kwhitecolor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white12,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        thickness: 2,
                                      ),
                                      Text(
                                        accountC.addressList[index].fullName,
                                        style: const TextStyle(
                                            color: kblackcolor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Delivery location: ${accountC.addressList[index].landMark}',
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        accountC.addressList[index].address,
                                        style: const TextStyle(
                                            color: kblackcolor, fontSize: 17),
                                      ),
                                      Text(
                                        '${accountC.addressList[index].place}, Pincode - ${accountC.addressList[index].pin}',
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        'Phone number: ${accountC.addressList[index].phone}',
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        'State: ${accountC.addressList[index].state}',
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                      kheight05,
                                      Row(
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: const BorderSide(
                                                color: kblackcolor,
                                              ),
                                              maximumSize: Size(
                                                  width * 0.37, height * 0.07),
                                              minimumSize: Size(
                                                width * 0.16,
                                                height * 0.006,
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.off(
                                                EditAddress(
                                                  height: height,
                                                  width: width,
                                                  model: accountC
                                                      .addressList[index],
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: kblackcolor),
                                            ),
                                          ),
                                          kwidth10,
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              maximumSize: Size(
                                                  width * 0.37, height * 0.07),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: const BorderSide(
                                                color: kblackcolor,
                                              ),
                                              minimumSize: Size(
                                                width * 0.16,
                                                height * 0.006,
                                              ),
                                            ),
                                            onPressed: () => showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text(
                                                    'Are you sure you want to remove your address?'),
                                                // content: const Text(
                                                //     'AlertDialog description'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: kblackcolor),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    child: const Text(
                                                      'Ok',
                                                      style: TextStyle(
                                                          color: kblackcolor),
                                                    ),
                                                    onPressed: () {
                                                      accountC.deleteAddress(
                                                          accountC
                                                              .addressList[
                                                                  index]
                                                              .id);
                                                      Navigator.pop(
                                                          context, 'OK');
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            child: const Text(
                                              'Remove',
                                              style:
                                                  TextStyle(color: kblackcolor),
                                            ),

                                            // onPressed: () {
                                            //   accountC.deleteAddress(accountC
                                            //       .addressList[index].id);
                                            // },
                                            // child: const Text(
                                            //   'Remove',
                                            //   style: TextStyle(
                                            //     fontSize: 15,
                                            //     color: kblackcolor,
                                            //   ),
                                            // ),
                                          ),
                                          kwidth10,
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: accountC.addressList.length,
                      );
          },
        ),
      ),
    );
  }
}
