import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/api_constant.dart';
import '../data/network.dart';

class AuthController extends GetxController{
  var codeController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var OTPController = TextEditingController();

  Future <dynamic> sendOtpApi(  Map<String, String>  body) async {
    var response = await callMultipartFileAPI(body, endPoint :sendOtp);
    if( response["data"]=="OTP sent successfully.") {
    }
    return true;
  }

  Future <dynamic> LoginApi(  Map<String, String>  body) async {
    var response = await callMultipartFileAPI(body, endPoint :login);
    return response["data"].length != 0;

  }
}