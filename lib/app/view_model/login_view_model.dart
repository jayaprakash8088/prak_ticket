// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:park_proj/app/api/repo.dart';
import 'package:park_proj/app/api/urls.dart';
import 'package:park_proj/app/models/login_response_model.dart';
import 'package:park_proj/app/models/venue_response_details.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/utils/app_shared_pref.dart';

import '../models/emp_details_response_model.dart';
import '../utils/my_strings.dart';

class LoginViewModel with ChangeNotifier {
  final Repository _repository = Repository();
  TextEditingController venueController = TextEditingController();
  TextEditingController employeeId = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hasImage = false;
  XFile? imageFile;
  final picker = ImagePicker();
  String? id;
  int? venueVal;
  List<int>? selectedFile;
  Uint8List? bytesData;
  Uint8List? webImage;
  String? path;
    final ImagePicker webPicker = ImagePicker();
    final ImagePickerWeb pickerWeb=ImagePickerWeb();
    PickedFile? pickedFile;
    dynamic image;
    void uploadImage() async {
      image = await webPicker.getImage(source: ImageSource.gallery);
      if (image != null) {
        pickedFile=image;
        var f = await image.readAsBytes();
        webImage = f;
        path = image.path;
        hasImage=true;
        notifyListeners();
      } else {}
    }
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile = pickedFile;
      hasImage = true;
      notifyListeners();
    }
  }

  LoginResponseModel? loginResponseModel;

  Future callLoginApi() async {
    Map<String, String> formData = {
      userNameKey: employeeId.text.trim(),
      passwordKey: password.text.trim(),
      venueKey: venueVal.toString(),
    };
    try {
      loginResponseModel = await _repository.loginUser(formData);
      if (loginResponseModel != null) {
        await AppSharedPref().saveToken(loginResponseModel!.token!);
        await AppSharedPref().saveId(employeeId.text.trim());
        await AppSharedPref().saveVenue(venueVal.toString());
        await AppSharedPref().saveVenueVal(venueController.text.toString());
        await AppSharedPref().saveLogged(true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

// get employee details
  StreamController<EmployeeDetailsResponseModel> employeeDetailsController =
      StreamController<EmployeeDetailsResponseModel>.broadcast();

  StreamController<EmployeeDetailsResponseModel> get employeeDetails =>
      employeeDetailsController;
  EmployeeDetailsResponseModel? empDetailResponseModel;

  Future getEmpDetails() async {
    id = await AppSharedPref().getId();
    String token = await AppSharedPref().getToken();
    try {
      empDetailResponseModel = await _repository.getEmployeeDetail(id!, token);
      employeeDetailsController.add(empDetailResponseModel!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // save emp details
  String shiftValue = '';

  String getShift() {
    if (AppConfig.now.hour < 13) {
      return shiftValue = 'A';
    } else {
      return shiftValue = 'B';
    }
  }

  Future saveEmployeeDetails(bool kIsWeb) async {
    var img = kIsWeb?webImage!:await imageFile!.readAsBytes();
    var base64 = base64Encode(img);
    var shiftVal=getShift();
    Map<String, dynamic> data = {
      empIdKey: empDetailResponseModel!.empid,
      shiftNameKey: shiftVal,
      imageByteKey: base64
    };
    String token = await AppSharedPref().getToken();
    try {
      dynamic response = await _repository.saveEmpDetails(data, token);
      if (response != null&&response) {
        await AppSharedPref().saveShift(shiftVal);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<VenueResponseModel> venueList = [];

  Future getVenue() async {
    try {
      dynamic response = await _repository.getVenueDetail(getVenueDetails);
      if (response != null) {
        venueList = [];
        for (int i = 0; i < response.length; i++) {
          venueList.add(VenueResponseModel(
              venueId: response[i]['venueId'],
              venueName: response[i]['venueName']));
        }
        venueList
            .add(VenueResponseModel(venueId: 12001, venueName: 'VMRDA PARK2'));
        venueList
            .add(VenueResponseModel(venueId: 12002, venueName: 'VMRDA PARK3'));
        venueList
            .add(VenueResponseModel(venueId: 12003, venueName: 'VMRDA PARK4'));
        venueList
            .add(VenueResponseModel(venueId: 12004, venueName: 'GOVT PARK1'));
        venueList
            .add(VenueResponseModel(venueId: 12005, venueName: 'GOVT PARK2'));
      } else {
        venueList = [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void setDropdownValue(String value) {
    for (int i = 0; i < venueList.length; i++) {
      if (venueList[i].venueId.toString() == value) {
        venueVal = int.parse(value);
        venueController.text = venueList[i].venueName!;
        break;
      }
    }
    notifyListeners();
  }

  checkMail() {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(employeeId.text.trim());
  }

  bool validatePassword() {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password.text.trim());
  }
}
