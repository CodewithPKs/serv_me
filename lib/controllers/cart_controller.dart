import 'package:get/get.dart';
import 'package:serv_me/data/repository/cart_repo.dart';

import '../models/cart_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> item ={};

  void addItem(){
    
  }
}