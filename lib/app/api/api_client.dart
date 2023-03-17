import 'package:flutter/material.dart';
import 'package:park_proj/app/api/urls.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import 'package:http/http.dart'as http;
class ApiClient {
//post
  Future dioPost(String url, dynamic formData) async {
    try {
      final response = await http.post(Uri.parse(baseUrl+url),body: formData,
      headers: {contentType: appJson});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future dioPostWithToken(String url, dynamic formData, String token) async {
    try {
      dynamic response = await http.post(Uri.parse(baseUrl+url), body: formData,
      headers: {
        contentType: appJson,
        authorization: bearer + token
      });
      if (response!=null&&response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // no body
  Future dioPostWithTokenNoBody(String url, String token) async {
    try {
      final response = await http.post(Uri.parse(baseUrl+url),headers: {
        contentType: appJson,
        authorization: bearer + token
      });
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get
  Future dioGet(String url) async {
    Map<String,String> header={
      'Content-Type': 'application/json',
    };
    try {
      final response1=await http.get(Uri.parse(baseUrl+url),headers: header);
      if (response1.statusCode == 200) {
        return response1.body;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future dioGetWithToken(String url, String token) async {
    try {
      final response = await http.get(Uri.parse(baseUrl+url),headers: {
        contentType: appJson,
        authorization: bearer + token
      });
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
