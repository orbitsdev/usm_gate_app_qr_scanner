import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_gate_app/features/scanner_screen.dart';



void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const USMGATE());
}
class USMGATE extends StatefulWidget {
  const USMGATE({ Key? key }) : super(key: key);

  @override
  _USMGATEState createState() => _USMGATEState();
}

class _USMGATEState extends State<USMGATE> {  
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GATE APP',
      home: ScannerScreen(),
      getPages: [

      ],
    );
  }
}