import 'package:flutter/material.dart';
import 'package:park_proj/app/view_model/qr_view_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    QRViewModel qrViewModel =
    Provider.of<QRViewModel>(context);
    Barcode? result;
    QRViewController qrController;
    onQRViewCreated(QRViewController controller) {
      qrController = controller;
      qrController.scannedDataStream.listen((scanData) {
        result = scanData;
        if(result!=null){
          qrController.stopCamera();
          qrViewModel.changeScanned(true);
          qrViewModel.verifyQr(result!.code!,context);
        }
      });
    }
    return SizedBox(
      height: 200.0,
      width:200.0,
      child:qrViewModel.isScanned?
      const SizedBox(
          width: 50.0,height: 50.0,
          child: CircularProgressIndicator()):
      QRView(
        onQRViewCreated: onQRViewCreated, key: qrKey
      ),
    );
  }
}
