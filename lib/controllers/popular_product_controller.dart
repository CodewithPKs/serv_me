import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serv_me/data/repository/popular_product_repo.dart';
import 'package:serv_me/models/products_model.dart';
import 'package:serv_me/utils/colors.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quanity = 0;
  int get quntity => _quanity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quanity;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      //print(_popularProductList);
      update();
    } else {

    }
  }

  void setQuntity(bool isIncrement){
    if(isIncrement){
      //print("tap" + _quanity.toString());
      _quanity = checkQuantity(_quanity+1);
    } else {
      _quanity = checkQuantity(_quanity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if(quantity <0){
      Get.snackbar("item Count", "You Can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if(quntity>20){
      Get.snackbar("item Count", "You Can't add more item!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initproduct(){
    _quanity=0;
    _inCartItem = 0;
    //if exixt
    //get from storage _inCartItem
  }
}