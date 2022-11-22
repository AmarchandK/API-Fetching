import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorHandler(Object e) {
  if (e is DioError) {
    if (e.response?.statusCode == 401) {
      showDialogue("401 Error");
    } else if (e.type == DioErrorType.connectTimeout) {
      showDialogue("Connection Timeout");
    } else if (e.type == DioErrorType.receiveTimeout) {
      showDialogue("Connection Timeout");
    } else if (e.type == DioErrorType.cancel) {
      showDialogue("Canceled");
    } else if (e.type == DioErrorType.sendTimeout) {
      showDialogue("Timeout");
    } else if (e.type == DioErrorType.response) {
      showDialogue(e.response!.statusMessage ?? "Can't Connect");
    } else if (e.type == DioErrorType.other) {
      showDialogue('Something went Wrong');
    }
  } else if (e is SocketException) {
    showDialogue(
      'No Internet Connection',
    );
  }
}

SnackbarController showDialogue(tittle) {
  return Get.showSnackbar(
    GetSnackBar(
      messageText: Text(
        tittle,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      icon: const Icon(CupertinoIcons.exclamationmark_shield),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.transparent,
      barBlur: 10,
      dismissDirection: DismissDirection.horizontal,
      overlayBlur: 1,
      margin: const EdgeInsets.all(20.0),
      animationDuration: const Duration(seconds: 2),
      snackStyle: SnackStyle.GROUNDED,
      forwardAnimationCurve: Curves.bounceInOut,
      reverseAnimationCurve: Curves.bounceOut,
      borderColor: Colors.red,
      borderRadius: 10,
    ),
  );
}
