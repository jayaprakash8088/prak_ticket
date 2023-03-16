import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:park_proj/app/api/urls.dart';
import 'package:park_proj/app/utils/my_strings.dart';

class ApiClient {
  Dio dio = Dio();
//post
  Future dioPost(String url, dynamic formData) async {
    try {
      dio.options.baseUrl = baseUrl;
      dio.options.headers = <String, dynamic>{contentType: appJson};
      final response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future dioPostWithToken(String url, dynamic formData, String token) async {
    try {
      dio.options.baseUrl = baseUrl;
      dio.options.headers = <String, dynamic>{
        contentType: appJson,
        authorization: bearer + token
      };
      dynamic response = await dio.post(url, data: formData);
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
      dio.options.baseUrl = baseUrl;
      dio.options.headers = <String, dynamic>{
        contentType: appJson,
        authorization: bearer + token
      };
      final response = await dio.post(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get
  Future dioGet(String url) async {
    try {
      dio.options.baseUrl = baseUrl;
      dio.options.headers = <String, dynamic>{contentType: appJson};
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future dioGetWithToken(String url, String token) async {
    try {
      dio.options.baseUrl = baseUrl;
      dio.options.headers = <String, dynamic>{
        contentType: appJson,
        authorization: bearer + token
      };
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
