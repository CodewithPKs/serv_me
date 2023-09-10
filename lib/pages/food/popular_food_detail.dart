import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:serv_me/controllers/popular_product_controller.dart';
import 'package:serv_me/pages/home/main_food-Page.dart';
import 'package:serv_me/utils/app_constants.dart';
import 'package:serv_me/utils/dimensions.dart';
import 'package:serv_me/widgets/app_column.dart';
import 'package:serv_me/widgets/app_icon.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initproduct();
    //print("page Id is"+pageId.toString());
    //print("Product Namer is"+product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //backgraund image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularfoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                    )
                  )
                ),
              )),
          //showing Icon widget
          Positioned(
            top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                     Get.to(()=>MainFoodPage());
                  },
                    child : AppIcon(icon: Icons.arrow_back_ios),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          //introduction of food
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularfoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radious20),
                    topLeft: Radius.circular(Dimensions.radious20)
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduced"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                            text:product.description!)  ,) )
                  ],
                ),
              )),

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: Dimensions.buttomheightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.widht30,
              right: Dimensions.widht30),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radious20*2),
                topRight: Radius.circular(Dimensions.radious20*2),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.height20,
                    right: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radious20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuntity(false);
                      },
                      child: Icon(Icons.remove, color: AppColors.signColor,),
                    ),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: popularProduct.quntity.toString()),
                    SizedBox(width: Dimensions.width10/2,),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuntity(true);
                      },
                      child: Icon(Icons.add, color: AppColors.signColor,),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.height20,
                    right: Dimensions.height20),
                child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radious20),
                    color: AppColors.mainColor
                ),
              )
            ],
          ),
        );
      },),
    );
  }
}
