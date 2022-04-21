import 'package:json_annotation/json_annotation.dart';

part 'food_banner.g.dart';

@JsonSerializable()

class FoodBanner {
  List<BannerData>? data;

  FoodBanner({
    List<BannerData>? data
  }) : data = data ?? <BannerData>[];

  factory FoodBanner.fromJson(Map<String, dynamic> json) => _$FoodBannerFromJson(json);

  Map<String, dynamic> toJson() => _$FoodBannerToJson(this);
}

@JsonSerializable()

class BannerData {
  int? id;
  String? name;
  String? page_url;
  String? original_page_url;
  String? media;
  int? banner_variant_id;

  BannerData({
    int? id, 
    String? name, 
    String? page_url, 
    String? original_page_url, 
    String? media, 
    int? banner_variant_id
  }) : id = id ?? 0,
       name = name ?? "",
       page_url = page_url ?? "",
       original_page_url = original_page_url ?? "",
       media = media ?? "",
       banner_variant_id = banner_variant_id ?? 0;

  factory BannerData.fromJson(Map<String, dynamic> json) => _$BannerDataFromJson(json);

  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}