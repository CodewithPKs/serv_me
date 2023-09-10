import 'package:get/get.dart';
import 'package:serv_me/controllers/cart_controller.dart';
import 'package:serv_me/controllers/popular_product_controller.dart';
import 'package:serv_me/data/api/api_client.dart';
import 'package:serv_me/data/repository/popular_product_repo.dart';
import 'package:serv_me/utils/app_constants.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async{

  //this is for client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //this is for repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controller
  Get.lazyPut(() =>  PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(() =>  RecommendedProductController(recommendedProductRepo:Get.find()));
  Get.lazyPut(() =>  CartController(cartRepo:Get.find()));
}