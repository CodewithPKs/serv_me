import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serv_me/routes/route_helper.dart';
import 'package:serv_me/utils/app_constants.dart';
import 'package:serv_me/utils/dimensions.dart';
import 'package:serv_me/widgets/app_icon.dart';
import 'package:serv_me/widgets/big_text.dart';
import 'package:serv_me/widgets/expandable_text.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../utils/colors.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(25),
              child: Container(
                child: Center(child: BigText(size: Dimensions.font26, text: product.name!,)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radious20),
                    topRight: Radius.circular(Dimensions.radious20),
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.teal[400],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                   width: double.maxFinite,
                   fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableText(text: product.description!),
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            )
          )],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.icon24,
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,),
                BigText(text: "\₹${product.price!}  X  0 ", color: AppColors.mainBlackcolor,size: Dimensions.font26,),
                AppIcon(
                  iconSize: Dimensions.icon24,
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,)
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,

                  )
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.height20,
                      right: Dimensions.height20),
                  child: BigText(text: "\₹ ${product.price!}| Add to cart", color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radious20),
                      color: AppColors.mainColor
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
