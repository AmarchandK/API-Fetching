import 'package:deep_nucleus/constants/const_strings.dart';
import 'package:deep_nucleus/model/response.dart';
import 'package:deep_nucleus/services/get_my_ad_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../view/overview/overview_page.dart';

class OverViewProvider extends ChangeNotifier {
  String appbarImage = '';
  late AdDetail adDetail;
  late OwnerDetails ownersDetail;
  late String userDate;
  late String adDate;
  late LatLng location;
  final Map<String, Marker> markers = {};
  bool loading = false;
  //////////////////////////////////////////////////////////////////////////////////
  void loadingFuction() {
    loading = !loading;
    notifyListeners();
  }

  //================================ APPBAR IMAGE ================================//
  void changeAppbarImage({required String image}) {
    appbarImage = image;
    notifyListeners();
  }

  //================================ SERVICE CALLING ================================//
  Future<void> getAdService({required String id}) async {
    loadingFuction();
    final AdsResponse? adsResponse = await AdService.getAd(
        id: id, url: ConstStrings.url, authTocken: ConstStrings.authTocken);
    if (adsResponse != null) {
      await _assignVariables(adsResponse);
      Get.to(() => const OverView(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500));
      loadingFuction();
    }
  }

  Future<void> _assignVariables(AdsResponse adsResponse) async {
    adDetail = adsResponse.adDetail;
    ownersDetail = adsResponse.ownerDetails;
    appbarImage = adDetail.imageUrl.first;
    userDate = ownersDetail.createdDate.toString().split("-").first;
    adDate = DateFormat.yMMMd().format(adDetail.createdAt);
    await _addressToLatLng();
  }
  //================================ MAP CALLING ================================//

  Future<void> _addressToLatLng() async {
    final query = adDetail.adPostedAddress;
    List<Address> cordinates =
        await Geocoder.local.findAddressesFromQuery(query);
    location = LatLng(cordinates.first.coordinates.latitude!,
        cordinates.first.coordinates.longitude!);
  }

  void addMarker() {
    Marker marker = Marker(
        markerId: MarkerId('$location'),
        position: location,
        infoWindow: InfoWindow(title: adDetail.adPostedAddress));
    markers.clear();
    markers['$location'] = marker;
    notifyListeners();
  }
}
