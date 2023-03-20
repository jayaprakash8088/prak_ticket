// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:park_proj/app/models/save_ticket_info.dart';
import 'package:park_proj/app/models/save_ticket_response_model.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import '../api/repo.dart';
import '../api/urls.dart';
import '../models/ticket_info_response_model.dart';
import '../utils/app_shared_pref.dart';
import 'package:printing/printing.dart';
import '../utils/print_doc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart'as http;
class HomePageViewModel with ChangeNotifier {
  final Repository _repository = Repository();
  TextEditingController mobileNumberController = TextEditingController();
  int adultVal = 0;
  int childVal = 0;
  int cycleVal = 0;
  int bikeVal = 0;
  int carVal = 0;
  int miniBusVal = 0;
  int largeBusVal = 0;
  int cameraVal = 0;
  int otherVal = 0;
  int adultTotalVal = 0;
  int childTotalVal = 0;
  int cycleTotalVal = 0;
  int bikeTotalVal = 0;
  int carTotalVal = 0;
  int miniBusTotalVal = 0;
  int largeBusTotalVal = 0;
  int cameraTotalVal = 0;
  int otherTotalVal = 0;
  int totalVal = 0;
  int totalQuantity = 0;
  bool cashClicked = false;
  int adultMulVal=0;
  int childMulVal=0;
  int twoWheelerMulVal=0;
  int fourWheelerMulVal=0;
  int cameraMulVal=0;
  int othersMulVal=0;
  var venueValue='';
  void changeCashCard() {
    cashClicked = !cashClicked;
    notifyListeners();
  }

  void changeValue(int pos, bool forInc) {
    switch (pos) {
      case 0:
        forInc ? adultVal++ : (adultVal != 0 ? adultVal-- : null);
        adultTotalVal = adultVal * adultMulVal;
        break;
      case 1:
        forInc ? childVal++ : (childVal != 0 ? childVal-- : null);
        childTotalVal = childVal * childMulVal;
        break;
      case 2:
        forInc ? cycleVal++ : (cycleVal != 0 ? cycleVal-- : null);
        cycleTotalVal = cycleVal * twoWheelerMulVal;
        break;
      case 3:
        forInc ? bikeVal++ : (bikeVal != 0 ? bikeVal-- : null);
        bikeTotalVal = bikeVal * twoWheelerMulVal;
        break;
      case 4:
        forInc ? carVal++ : (carVal != 0 ? carVal-- : null);
        carTotalVal = carVal * fourWheelerMulVal;
        break;
      case 5:
        forInc ? miniBusVal++ : (miniBusVal != 0 ? miniBusVal-- : null);
        miniBusTotalVal = miniBusVal * fourWheelerMulVal;
        break;
      case 6:
        forInc ? largeBusVal++ : (largeBusVal != 0 ? largeBusVal-- : null);
        largeBusTotalVal = largeBusVal * fourWheelerMulVal;
        break;
      case 7:
        forInc ? cameraVal++ : (cameraVal != 0 ? cameraVal-- : null);
        cameraTotalVal = cameraVal * cameraMulVal;
        break;
      case 8:
        forInc ? otherVal++ : (otherVal != 0 ? otherVal-- : null);
        otherTotalVal = otherVal * othersMulVal;
        break;
    }
    setTotalValue();
    notifyListeners();
  }

  String getTotalValue(int pos){
    String value='';
    switch (pos) {
      case 0:
        value=adultTotalVal.toString();break;
      case 1:
        value= childTotalVal.toString();break;
      case 2:
        value= cycleTotalVal.toString();break;
      case 3:
        value= bikeTotalVal.toString();break;
      case 4:
        value=carTotalVal.toString();break;
      case 5:
        value= miniBusTotalVal.toString();break;
      case 6:
        value= largeBusTotalVal.toString();break;
      case 7:
        value=cameraTotalVal.toString();break;
      case 8:
        value= otherTotalVal.toString();break;
    }
    return value;
  }

  String getChipValue(int pos) {
    String value = '';
    switch (pos) {
      case 0:
        value = adultVal.toString();
        break;
      case 1:
        value = childVal.toString();
        break;
      case 2:
        value = cycleVal.toString();
        break;
      case 3:
        value = bikeVal.toString();
        break;
      case 4:
        value = carVal.toString();
        break;
      case 5:
        value = miniBusVal.toString();
        break;
      case 6:
        value = largeBusVal.toString();
        break;
      case 7:
        value = cameraVal.toString();
        break;
      case 8:
        value = otherVal.toString();
        break;
    }
    return value;
  }

  dynamic setTotalValue() {
    totalVal = adultTotalVal +
        childTotalVal +
        cycleTotalVal +
        bikeTotalVal +
        carTotalVal +
        miniBusTotalVal +
        largeBusTotalVal+
        cameraTotalVal +
        otherTotalVal;
    totalQuantity=adultVal +
        childVal +
        cycleVal +
        bikeVal +
        carVal +
        miniBusVal +
        largeBusVal+
        cameraVal +
        otherVal;
  }


  List<TicketInfoResponseModel> ticketInfo = [];
  bool  hasValue =false;

  Future getTicketDetail() async {
    hasValue =false;
    var token=await AppSharedPref().getToken();
   venueValue=await AppSharedPref().getVenueVal();
    ticketInfo=[];
    try {
      dynamic response = await _repository.getTicketDetails(getTicketInfo,token);
      if (response!=null) {
        await addTicket(response);
        await setValues();
        hasValue = true;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  setValues()async {
    if(ticketInfo.isNotEmpty){ for(int i=0;i<ticketInfo.length;i++){
      if(ticketInfo[i].rateTypeName!.toLowerCase().contains(adult.toLowerCase())){
        adultMulVal==0?adultMulVal=ticketInfo[i].rateTypeAmount!:null;
      }else if(ticketInfo[i].rateTypeName!.toLowerCase().contains(child.toLowerCase())){
        childMulVal==0?childMulVal=ticketInfo[i].rateTypeAmount!:null;
      }else if(ticketInfo[i].rateTypeName!.toLowerCase().contains(twoWheeler.toLowerCase())){
        twoWheelerMulVal==0?twoWheelerMulVal=ticketInfo[i].rateTypeAmount!:null;
      }else if(ticketInfo[i].rateTypeName!.toLowerCase().contains(fourWheeler.toLowerCase())){
        fourWheelerMulVal==0?fourWheelerMulVal=ticketInfo[i].rateTypeAmount!:null;
      }else if(ticketInfo[i].rateTypeName!.toLowerCase()==(camera1.toLowerCase())){
        cameraMulVal==0?cameraMulVal=ticketInfo[i].rateTypeAmount!:null;
      }else if(ticketInfo[i].rateTypeName!.toLowerCase().contains(videoCamera.toLowerCase())){
        othersMulVal==0?othersMulVal=ticketInfo[i].rateTypeAmount!:null;
      }
    }}else {
      adultMulVal = 10;
      childMulVal = 5;
      twoWheelerMulVal = 20;
      fourWheelerMulVal = 50;
      cameraMulVal = 100;
      othersMulVal = 150;
    }
  }

  SaveTicketInfo? saveTicketInfo;
  SaveTicketInfoResponseModel? ticketInfoResponseModel;
  List<TicketType> tickets=[];
  String ticketId='';
  Future saveTicket()async{
    ticketInfoResponseModel=SaveTicketInfoResponseModel();
    tickets=[];
   var venue=await AppSharedPref().getVenue();
    var employeeId=await AppSharedPref().getId();
    try{
      await setTickets();
      saveTicketInfo=SaveTicketInfo(venueId: venue,
      empid:employeeId,mobileNumber:mobileNumberController.text.trim(),
      paymentStatus:success,
      paymentType: cashClicked?cash:card,
      totalAmount: totalVal,totalQuantity: totalQuantity,
      ticketTypes:tickets );
      ticketInfoResponseModel=await callSaveTicketApi();
     if(ticketInfoResponseModel!=null){
       ticketId=ticketInfoResponseModel!.ticketId??'';
       return true;
     }else{return false;}
    }catch(e){debugPrint(e.toString());}
  }
Future callSaveTicketApi()async{
 try{
   var token=await AppSharedPref().getToken();
   dynamic response=await _repository.saveTicketDetail(saveTicketInfo!,token);
   if(response!=null){
     return response;
   }else{
     return null;
   }
 }catch(e){
   debugPrint(e.toString());
 }

}
  setTickets() async{
  await setAdult();
  await setChild();
  await setCycle();
  await setBike();
  await setCar();
  await setMiniBus();
  await setLargeBus();
  await setCamera();
  await setOther();

  }

   setAdult() {
    if(adultVal!=0){
      tickets.add(TicketType(amount: adultMulVal,name: adult,quantity: adultVal));
    }
  }
   setChild() {
    if(childVal!=0){
      tickets.add(TicketType(amount:childMulVal ,name: child,quantity: childVal));
    }
  }
   setBike() {
    if(bikeVal!=0){
      tickets.add(TicketType(amount:twoWheelerMulVal ,name: bike,quantity:bikeVal ));
    }
  }
   setCar() {
    if(carVal!=0){
      tickets.add(TicketType(amount:fourWheelerMulVal ,name: car,quantity:carVal ));
    }
  }
   setMiniBus() {
    if(miniBusVal!=0){
      tickets.add(TicketType(amount:fourWheelerMulVal ,name: miniBus,quantity:miniBusVal ));
    }
  }
   setLargeBus() {
    if(largeBusVal!=0){
      tickets.add(TicketType(amount: fourWheelerMulVal,name: largeBus,quantity:largeBusVal ));
    }
  }
   setCamera() {
    if(cameraVal!=0){
      tickets.add(TicketType(amount:cameraMulVal ,name: camera,quantity:cameraVal ));
    }
  }
   setOther() {
    if(otherVal!=0){
      tickets.add(TicketType(amount:othersMulVal ,name: other,quantity:otherVal ));
    }
  }
   setCycle() {
    if(cycleVal!=0){
      tickets.add(TicketType(amount:twoWheelerMulVal ,name: cycle,quantity:cycleVal ));
    }
  }
clearValues(){
   adultVal = 0;
   childVal = 0;
   cycleVal = 0;
   bikeVal = 0;
   carVal = 0;
   miniBusVal = 0;
   largeBusVal = 0;
   cameraVal = 0;
   otherVal = 0;
   adultTotalVal = 0;
   childTotalVal = 0;
   cycleTotalVal = 0;
   bikeTotalVal = 0;
   carTotalVal = 0;
   miniBusTotalVal = 0;
   largeBusTotalVal = 0;
   cameraTotalVal = 0;
   otherTotalVal = 0;
   totalVal = 0;
   totalQuantity = 0;
   mobileNumberController.text='';
}

  addTicket(response) {
    for(int i=0;i<response.length;i++){
      ticketInfo.add(TicketInfoResponseModel(rateTypeAmount: response[i]['rateTypeAmount'],
          rateTypeName: response[i]['rateTypeName']));
    }
  }
  dynamic printDoc(BuildContext ctx)async{
    String value=await AppSharedPref().getVenueVal();
    final doc = pw.Document();
    final font = await PdfGoogleFonts.openSansRegular();
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) =>Print.buildPrint(this,ctx,value,font),//here goes the widgets list
      ),
    );
    Navigator.pop(ctx);
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }


  List<Uint8List> pngBytes=[];
  Future<dynamic> loadBytes()async{
    pngBytes=[];
    for(int i=0;i<ticketInfoResponseModel!.qrResponses!.length;i++){
      var res=await http.get(Uri.parse(ticketInfoResponseModel!.qrResponses![i].qrCodePath!));
      pngBytes.add(await testCompressList(res.bodyBytes));
    }
  }

  Future<Uint8List> testCompressList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      quality: 96,
    );
    return result;
  }
  @override
  void dispose() {
    super.dispose();
    clearValues();
  }
}
