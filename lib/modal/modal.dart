import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Modal {
  static void failure(
      BuildContext context, String title, String body) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(20),
            backgroundColor: Colors.transparent,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Lottie.asset(
                          'assets/images/failed.json',
                          height: 160,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            title.toUpperCase(),
                            style: Get.textTheme.displaySmall!.copyWith(
                              // color: Colors.black87,
                              // color: Colors.green[700],
                              color: Colors.red[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              body.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: Get.textTheme.headlineLarge!
                                  .copyWith(fontSize: 24),
                            ),
                          ),
                        
                          SizedBox(
                            height: 20,
                          ),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25),
                          //     ),
                          //     primary: Colors.redAccent,
                          //   ),
                          //   onPressed: () {
                          //     Get.back();
                          //   },
                          //   child: Text(
                          //     'OK'.toUpperCase(),
                          //     style: Get.textTheme.headline3,
                          //   ),
                          // ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () => Get.back(),
                              child: Text(
                                'OK',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        }
        );
  }
  static void success(
      BuildContext context, String title, String? id_number, String? name, String? type) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(20),
            backgroundColor: Colors.transparent,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Lottie.asset(
                          'assets/images/success.json',
                          height: 160,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            title.toUpperCase(),
                            style: Get.textTheme.displaySmall!.copyWith(
                              // color: Colors.black87,
                              // color: Colors.green[700],
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            id_number != null ? id_number.toString() : '',
                            style: Get.textTheme.displaySmall!.copyWith(
                              // color: Colors.black87,
                              // color: Colors.green[700],
                              color: Colors.green,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            child: Text(
                              '${name}',
                              textAlign: TextAlign.center,
                              style: Get.textTheme.headlineLarge!
                                  .copyWith(fontSize: 24),
                            ),
                          ),
                          Container(
                            child: Text(
                              '[ ${type} ]',
                              textAlign: TextAlign.center,
                              style: Get.textTheme.headlineLarge!.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25),
                          //     ),
                          //     primary: Colors.redAccent,
                          //   ),
                          //   onPressed: () {
                          //     Get.back();
                          //   },
                          //   child: Text(
                          //     'OK'.toUpperCase(),
                          //     style: Get.textTheme.headline3,
                          //   ),
                          // ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () => Get.back(),
                              child: Text(
                                'OK',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        }
        );
  }
}
