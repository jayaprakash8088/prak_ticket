import 'package:flutter/material.dart';
import 'package:park_proj/app/api/api_client.dart';
import 'package:park_proj/app/api/urls.dart';
import 'package:park_proj/app/models/login_response_model.dart';
import 'package:park_proj/app/models/save_ticket_info.dart';
import 'package:park_proj/app/models/save_ticket_response_model.dart';
import 'package:park_proj/app/models/scan_response_model.dart';
import '../models/emp_details_response_model.dart';

class Repository{
  final ApiClient _apiClient=ApiClient();
  Future<dynamic>loginUser(dynamic formData)async{
    try{
      dynamic response=await _apiClient.dioPost(accountLogin, formData);
      return LoginResponseModel.fromJson(response);
    }catch(e){
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getEmployeeDetail(String id,String token)async {
    try{
      dynamic response=await _apiClient.dioGetWithToken(getEmployeeDetails+id,token);
      return EmployeeDetailsResponseModel.fromJson(response);
    }catch(e){
      debugPrint(e.toString());
    }
  }
  Future<dynamic> getTicketDetails(String url,String token)async{
    try{
      dynamic response=await _apiClient.dioGetWithToken(url,token);
    if(response!=null){
      return response;
    }else{
      return null;
    }
    }catch(e){debugPrint(e.toString());}
  }

  Future saveEmpDetails(Map<String, dynamic> data,String token) async{
    try{
      dynamic response=await _apiClient.dioPostWithToken(submitDailyLoginDetails, data,token);
      return response;
    }catch(e){debugPrint(e.toString());}
  }

  Future getVenueDetail(String url) async{
    try{
      dynamic response=await _apiClient.dioGet(url);
      if(response!=null){
        return response;
      }else{return null;}
    }catch(e){debugPrint(e.toString());}
  }
  
  Future saveTicketDetail(SaveTicketInfo model,String token)async{
    try{
      dynamic response=await _apiClient.dioPostWithToken(saveTicketInfo, model, token);
      if(response!=null){
        return response;
      }else{
        return null;
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  // verify ticket
  Future verifyTicket(String ticketId,String token)async{
    try{
      dynamic response=await _apiClient.dioPostWithTokenNoBody(verifyQrCode+ticketId, token);
      if(response!=null){
        return ScanInfoResponseModel.fromJson(response);
      }else{
        return null;
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }
}