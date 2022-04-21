

import 'package:dio/dio.dart';
import 'package:food_id/models/food_banner.dart';

class BannerProvider {
  Dio dio = Dio();
  Response? response;
  FoodBanner? foodBanner = FoodBanner();


  Future<FoodBanner> get() async {
    try {
      response = await dio.get('http://food.Mockable.io/v1/banner');
      foodBanner = FoodBanner.fromJson(response!.data);

      return foodBanner!;
    } catch (e) {
      throw(e);
    }
  }
}