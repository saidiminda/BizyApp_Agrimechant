import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'show_dialogs.dart';

class ResponseHandler {
  //Function for handling response
  void responseHandler(Response response) {
    if (response.body != null) {
      print(response.body.toString());
      switch (response.statusCode) {
        case 200:
          Get.back();
          //Starting  Successful dialog
          showCastomDialog(response.body["message"], Colors.green);
          // showDialog("Successful", response.body["message"], Colors.green);
          break;
        case 201:
          Get.back();
          showCastomDialog(response.body["message"], Colors.green);
          break;
        case 202:
          Get.back();
          showCastomDialog(response.body["message"], Colors.green);

          break;
        case 500:
          Fluttertoast.showToast(
              msg: "failedSystemError".tr,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          break;
        case 403:
          showCastomDialog(response.body["message"], Colors.red);

          break;
        case 422:
          showCastomDialog(response.body["message"], Colors.red);

          break;
        default:
          //Starting Error dialog
          showCastomDialog(response.statusText.toString(), Colors.red);
          break;
      }
    } else {
      //Starting Error dialog
      showCastomDialog(response.statusText.toString(), Colors.red);
    }
  }

  void responseHandlerOnSinglePage(Response response) {
    if (response.body != null) {
      switch (response.statusCode) {
        case 200:
          Fluttertoast.showToast(
              msg: response.body["message"],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          break;
        case 201:
          Fluttertoast.showToast(
              msg: response.body["message"],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          break;
        case 202:
          Fluttertoast.showToast(
              msg: response.body["message"],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

          break;
        case 500:
          Fluttertoast.showToast(
              msg: "failedSystemError".tr,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          break;
        case 403:
          showCastomDialog(response.body["message"], Colors.red);

          break;
        case 422:
          Fluttertoast.showToast(
              msg: response.body["message"],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);

          break;
        default:
          //Starting Error dialog
          showCastomDialog("failed".tr, Colors.red);
          break;
      }
    } else {
      //Starting Error dialog
      showCastomDialog("failed".tr, Colors.red);
    }
  }
}
