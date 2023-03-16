import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/my_style.dart';
import 'package:park_proj/app/view/common_widgets.dart';
import 'package:park_proj/app/view/login/login_page.dart';
import 'package:park_proj/app/view/scar_qr/scan.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_strings.dart';

class ScanQRScreen extends StatelessWidget {
  const ScanQRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showAlertDialog(context);
                    },
                    child:
                    const Icon(Icons.logout, color: blackColor, size: 24.0),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
                Text(scanQRCode,style: MyStyle.getMediumLargeBlackText(context),),
              const SizedBox(height: 5.0),
                Text(alignQR,style: MyStyle.getGrayText1(context),overflow: TextOverflow.clip,),
              const SizedBox(height: 50.0),
              Card(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.45,
                      width: MediaQuery.of(context).size.width*0.75,
                      child: const Scan())),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    ));
  }

   _showAlertDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SharedAlertDialog(
            cancelText: "No",
            titleText: "Do you want to exit ?",
            confirmText: "Yes",
            
            onTappingCancel: () {
             Navigator.pop(context);
            },
            onTappingConfirm: () {
             Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
            });
       
      },
    );
}
}