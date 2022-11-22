import 'dart:developer';

import 'package:deep_nucleus/constants/error_handler.dart';
import 'package:deep_nucleus/model/response.dart';
import 'package:dio/dio.dart';

class AdService {
  static Future<AdsResponse?> getAd(
      {required String id,
      required String authTocken,
      required String url}) async {
    final Map<String, String> body = {"ad_id": id};
    try {
      final Response response = await Dio().post(url,
          data: body,
          options: Options(headers: {"Authorization": "Bearer $authTocken"}));
          
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log("success status");
        return AdsResponse.fromJson(response.data);
      }
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }
}
