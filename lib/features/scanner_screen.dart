import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:usm_gate_app/features/scanner_controller.dart';
import 'package:usm_gate_app/modal/modal.dart';
import 'package:usm_gate_app/widgets/custom_button_style.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String _scanBarcode = 'Unknown';

  final scannerController = Get.put(ScannerController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/kidapawan-building.jpg',
              fit: BoxFit.cover),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xffffe696).withOpacity(0.90),
                Color(0xff6d430b).withOpacity(0.90),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          
            ),
            child: SingleChildScrollView(
           
              padding: EdgeInsets.symmetric(horizontal: 20, vertical:10 ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10,),
                  Image.asset('assets/images/usm-kidapawan-logo.png',
                     fit: BoxFit.cover,
                     height: 150,
                     width: 150,
                 )
                 .animate()
                .moveY(
                  curve: Curves.easeInOut,
                  begin: 10,
                  end: 0,
                  duration: const Duration(
                    seconds: 1,
                  ),
                )
                .fadeIn(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 700)),
               SizedBox(height:24),

                 Text('QR SCANNER', style:TextStyle(fontSize:30, color: Colors.white, fontWeight: FontWeight.bold ), textAlign: TextAlign.center,)
                 .animate()
                  .moveY(
                  curve: Curves.easeInOut,
                  begin: 20,
                  end: 0,
                  duration: const Duration(
                    seconds: 2,
                  ),
                )
                .fadeIn(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 700)),
               SizedBox(height:24),
                 
                 
                
               SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

                 SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),    
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                                          onPressed: ()=>scannerController.scanBarcodeNormal(context:context, type: 'entry'), 

                      child: Text('Entry Scan', style: TextStyle(fontSize: 24),),),
                    )
                    .animate()
                  .moveY(
                  curve: Curves.easeInOut,
                  begin: 20,
                  end: 0,
                  duration: const Duration(
                    seconds: 2,
                  ),
                )
                .fadeIn(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 700))
                    ,
                 SizedBox(height: 20,),
                 SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),    
                      backgroundColor: Color(0xffFA8A02),
                      foregroundColor: Colors.white,
                    ),
                      onPressed: ()=>scannerController.scanBarcodeNormal(context: context, type: 'exit'), 
                     child: Text('Exit Scan', style: TextStyle(fontSize: 24),),),
                    )
                    .animate()
                  .moveY(
                  curve: Curves.easeInOut,
                  begin: 20,
                  end: 0,
                  duration: const Duration(
                    seconds: 2,
                  ),
                )
                .fadeIn(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 700))
                    ,
                          //  SizedBox(height: 20,),
                //  SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: 50,
                //   child: ElevatedButton(
                    
                //     style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20)
                //       ),    
                //       backgroundColor: Colors.pink,
                //       foregroundColor: Colors.white,
                //     ),
                //       onPressed: ()=>Modal.success(context, 'Success','123123', 'Hanna Marie Kate','Student' ,), 
                //      child: Text('Test Modal', style: TextStyle(fontSize: 24),),),
                //     ),
                //  ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.abc), label: Text('Scann To Exit')),

                
                 
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(FontAwesomeIcons.dochub),),
    );

    // return Scaffold(
    //   extendBody: true,
    //   body: SingleChildScrollView(
    //     child: Container(
    //       constraints: BoxConstraints(
    //         minHeight: MediaQuery.of(context).size.height,
    //         maxWidth: MediaQuery.of(context).size.width,
    //       ),
    //       decoration: BoxDecoration(

    //         gradient: LinearGradient(colors: [
    //           Color(0xffffe696),
    //           Color(0xff6d430b).withOpacity(0.90),

    //         ],

    //         begin: Alignment.topRight,
    //         end: Alignment.bottomCenter,
    //         )
    //       ),
    //       child: Column(
    //         children: [
    //           Container(),
    //         Image.asset('assets/images/usm-kidapawan-logo.png', fit: BoxFit.cover),

    //         ],
    //         )
    //       ),
    //     ),
    //   );

    // return Scaffold(

    //   body: Obx(
    //     ()=>
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text('${scannerController.scanBarCode}'),
    //         ElevatedButton(
    //           style: CustomButtonStyles.fillDeepOrange,
    //           onPressed: ()=>scannerController.scanBarcodeNormal(type: 'entry'), child: Text('Scanned For Entry')),
    //         SizedBox(height: 20,),
    //         ElevatedButton(
    //                         style: CustomButtonStyles.fillGray,

    //           onPressed: ()=>scannerController.scanBarcodeNormal(type: 'exit'), child: Text('Scanned For Exit')),

    //         ElevatedButton(

    //           onPressed: ()=>Modal.failure(context, 'Test', 'Testing Modal'), child: Text('Modal')),

    //       ],
    //     ),
    //   ),
    // );
  }
}
