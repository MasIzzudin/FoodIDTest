// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodBanner _$FoodBannerFromJson(Map<String, dynamic> json) {
  return FoodBanner(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => BannerData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FoodBannerToJson(FoodBanner instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) {
  return BannerData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    page_url: json['page_url'] as String?,
    original_page_url: json['original_page_url'] as String?,
    media: json['media'] as String?,
    banner_variant_id: json['banner_variant_id'] as int?,
  );
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'page_url': instance.page_url,
      'original_page_url': instance.original_page_url,
      'media': instance.media,
      'banner_variant_id': instance.banner_variant_id,
    };
