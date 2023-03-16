
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:park_proj/app/models/scan_response_model.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/utils/app_shared_pref.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../api/repo.dart';

class QRViewModel with ChangeNotifier{
  Barcode? result;
  final Repository _repository = Repository();
  bool  isScanned=false;
  ScanInfoResponseModel? scanInfoResponseModel;
 Future verifyQr(String id, BuildContext context)async{
   AppConfig.dialog(context, pleaseWait);
   var token=await AppSharedPref().getToken();
    try{
      scanInfoResponseModel=await _repository.verifyTicket(id, token);
      if(scanInfoResponseModel!=null){
        Navigator.pop(context);
        var result=await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AppConfig.dialogForScan(context,scanInfoResponseModel!.isValid!);
            });
        if(result!=null){
          changeScanned(false);
        }
      }else{
        Navigator.pop(context);
        var result=await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AppConfig.dialogForScan(context,scanInfoResponseModel!.isValid!);
            });
        if(result!=null){
          changeScanned(false);
        }
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  void changeScanned(bool value) {
   isScanned=value;
   notifyListeners();
  }
}