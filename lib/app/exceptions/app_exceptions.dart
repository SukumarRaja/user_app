
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class AppException implements Exception{
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  int? code;
  String message;

  FetchDataException(this.message, this.code)
      : super(message, "") {

    if(code!=500) {
      Get.toNamed('/500');
    }
    Get.defaultDialog(

        onConfirm: () {
          Get.offNamed('/');
        },
        onCancel: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        },
        textCancel: 'Close App',
        textConfirm: 'Home',
        middleText: message
    );

  }
}

class BadRequestException extends AppException {
  int code;
  String message;

  BadRequestException(this.message, this.code)
      : super(message, "Invalid Request: ") {
    navigator!.pushNamed('/' + code.toString());
    String scode = code != null ? code.toString() : '404';
    Get.offNamed('/' + scode);

    /*AlertBox.show(
        callback: () {
          Get.back();
        },
        title: 'Error ' + scode,
        message: Text(message));*/

  }
}

class UnauthorisedException extends AppException {
  int code;
  String message;
  String next;
  var res;

  UnauthorisedException(this.res,this.message, this.code,{this.next=""})
      : super(message, "Unauthorised: ") {
    String scode = code != null ? code.toString() : '404';
    //navigator.pushNamed('/login');
    // Utility.log("next screen $next error $res");
    // LoginController.to.otpStatusFor.value="Login";

    if (next == "USER_DISABLED") {
      Get.back();
      Get.toNamed('/pendingApproval');
    }
    else if(next=="CUSTOMER_NOT_REGISTERED"){
      // Utility.log("entered test ");
      Get.snackbar('Error', message);
      // SnackBarCommon.showSnack("Error", message);
      Get.back();
      Get.back();
    }
    else if(next=="VERIFY_PHONE_SCREEN"){
      Get.toNamed('/otpMobile');
    }else {
      Get.back();
      // userPref.token.val=null;
      Get.toNamed('/login');
      Get.snackbar("Error", message);
      // SnackBarCommon.showSnack("Error", message);
    }
    /*AlertBox.show(
        callback: () {
          Get.back();
        },
        title: 'Error ' + scode,
        message: Text(message));*/

  }
}
