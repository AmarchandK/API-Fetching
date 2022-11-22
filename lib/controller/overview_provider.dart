import 'dart:developer';

import 'package:deep_nucleus/constants/const_strings.dart';
import 'package:deep_nucleus/model/response.dart';
import 'package:deep_nucleus/services/get_my_ad_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../view/overview/description_page.dart';

class OverViewProvider extends ChangeNotifier {
  String appbarImage = '';
  late AdDetail adDetail;
  late OwnerDetails ownersDetail;
  late String userDate;
  late String adDate;
  LatLng location = const LatLng(25.1193, 55.3773);
  //================================ APPBAR IMAGE ================================//
  void changeAppbarImage({required String image}) {
    appbarImage = image;
    notifyListeners();
  }

  //================================ SERVICE CALLING ================================//
  Future<void> getAdService({required String id}) async {
    final AdsResponse? adsResponse = await AdService.getAd(
        id: id, url: ConstStrings.url, authTocken: ConstStrings.authTocken);
    if (adsResponse != null) {
      _assignVariables(adsResponse);
      Get.to(() => const Description());
    }
  }

  void _assignVariables(AdsResponse adsResponse) {
    adDetail = adsResponse.adDetail;
    ownersDetail = adsResponse.ownerDetails;
    appbarImage = adDetail.imageUrl.first;
    userDate = ownersDetail.createdDate.toString().split("-").first;
    adDate = DateFormat.yMMMd().format(adDetail.createdAt);
    log(adDate);
  }
}
