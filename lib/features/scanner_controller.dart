import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:http/http.dart' as http;
import 'package:usm_gate_app/modal/modal.dart';

class ScannerController extends GetxController {
  var cardId = ''.obs;
  var scanBarCode = ''.obs;

  Future<void> checkCard() async {
  }

  Future<void> scanBarcodeNormal(
      {required String type, required BuildContext context}) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);

      if (barcodeScanRes != '-1') {
         
        fetchApi(context: context, type: type, id_number: barcodeScanRes);
      } else {

      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    scanBarCode(barcodeScanRes);
  }

Future<void> fetchApi({
  required String type,
  required BuildContext context,
  required String id_number,
}) async {
  var url = Uri.parse('http://146.190.86.129/api/check-card');

  Map<String, dynamic> body = {
    'id_number': id_number,
    'source': 'Mobile',
    'scanned_type': type,
    'door_name': 'Mobile',
    'request_type': 'saving',
  };

  try {
    http.Response response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var resposeData = jsonDecode(response.body);

      var isSuccess = resposeData['success'];
      if (isSuccess) {
        if (resposeData['data'] != null) {
          if (resposeData['data']['account'] != null) {
            var fullName = resposeData['data']['account']['first_name'] +
                resposeData['data']['account']['last_name'];
            var idNumber = resposeData['data']['id_number'];
            var accountType = resposeData['data']['account']['account_type'];

            Modal.success(
              context,
              'Success',
              idNumber?.toString() ?? '',
              fullName?.toString() ?? '',
              accountType?.toString() ?? '',
            );
          } else {
            var idNumber = resposeData['data']['id_number'];

            Modal.success(
              context,
              'Success',
              idNumber?.toString() ?? '',
              'No Account',
              'Unknown',
            );
          }
        } else {
          Modal.failure(context, 'Failed', 'No Data', );
        }
      } else {
        Modal.failure(context, 'failed', resposeData['error_type']+' ' +id_number ?? 'Unknown', );
      }
    } else {
      Modal.failure(context, 'failed', 'Api Failed', );
    }
  } catch (e) {
    Modal.failure(context, 'failed', e.toString(), );
  }
}

  // Future<void> fetchApi(
  //     {required String type,
  //     required BuildContext context,
  //     required String id_number}) async {
  //   var url = Uri.parse('http://146.190.86.129/api/check-card');

  //   Map<String, dynamic> body = {
  //     'id_number': id_number,
  //     'source': 'Mobile',
  //     'scanned_type': type,
  //     'door_name': 'Mobile',
  //     'request_type': 'saving',
  //   };

  //   http.Response response = await http.post(url, body: body);

  //   try {
  //     if (response.statusCode == 200) {
  //       var resposeData = jsonDecode(response.body);


  //       var isSuccess = resposeData['success'];
  //       if (isSuccess) {

  //         if (resposeData['data'] != null) {
  //           // Modal.success(context, 'Success','123123', 'Hanna Marie Kate','Student' ,);
  //           if (resposeData['data']['account'] != null) {
  //             // Map<String, dynamic> displayData = resposeData['data']['account'];

  //             var fullName = resposeData['data']['account']['first_name'] +
  //                 resposeData['data']['account']['last_name'];
  //             var idNumber = resposeData['data']['id_number'];
  //             var accountType = resposeData['data']['account']['account_type'];
  //             Modal.success(
  //               context,
  //               'Success',
  //               idNumber?.toString() ?? '',
  //               fullName?.toString() ?? '',
  //               accountType?.toString() ?? '',
  //             );

              
  //           } else {
  //             var idNumber = resposeData['data']['id_number'];

  //             Modal.success(
  //               context,
  //               'Success',
  //               idNumber?.toString() ?? '',
  //               'No Account',
  //               'Unknown',
  //             );
  //             // Modal.failure(context, 'Failed', 'No Account', );
  //           }
  //         } else {
  //           Modal.failure(context, 'Failed', 'No Data', );
  //         }
  //       } else {

  //              Modal.failure(context, 'failed', resposeData['error_type']+' ' +id_number ?? 'Unknown', );
 
  //       }
  
  //     } else {
    
  //       Modal.failure(context, 'failed', 'Api Failed', );
  //     }
  //   } catch(e) {
  //       Modal.failure(context, 'failed', e.toString(), );
    
  //   }
  // }

}
