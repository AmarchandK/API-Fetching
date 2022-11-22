class AdsResponse {
  AdsResponse({
    required this.adDetail,
    required this.ownerDetails,
  });
  AdDetail adDetail;
  OwnerDetails ownerDetails;
  factory AdsResponse.fromJson(Map<String, dynamic> json) => AdsResponse(
        adDetail: AdDetail.fromJson(json["AdDetail"]),
        ownerDetails: OwnerDetails.fromJson(json["ownerDetails"]),
      );
}

class AdDetail {
  AdDetail({
    required this.subCategory,
    required this.description,
    required this.specialMention,
    required this.title,
    this.price,
    required this.imageUrl,
    required this.adPostedAddress,
    required this.adStatus,
    required this.adType,
    required this.createdAt,
  });
  String subCategory;
  String description;
  List<String> specialMention;
  String title;
  int? price;
  List<String> imageUrl;
  String adPostedAddress;
  String adStatus;
  String adType;
  DateTime createdAt;
  factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
        subCategory: json["sub_category"],
        description: json["description"],
        specialMention:
            List<String>.from(json["special_mention"].map((x) => x)),
        title: json["title"],
        price: json["price"] ?? 0,
        imageUrl: List<String>.from(json["image_url"].map((x) => x)),
        adPostedAddress: json["ad_posted_address"],
        adStatus: json["ad_status"],
        adType: json["ad_type"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}

class OwnerDetails {
  OwnerDetails({
    required this.name,
    required this.createdDate,
    required this.profileUrl,
  });
  String name;
  DateTime createdDate;
  String profileUrl;
  factory OwnerDetails.fromJson(Map<String, dynamic> json) => OwnerDetails(
        name: json["name"],
        createdDate: DateTime.parse(json["created_date"]),
        profileUrl: json["profile_url"],
      );
}
