import 'package:flutter/material.dart';
import 'package:fluttershoppingwithgetx/controllers/product_controller.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class HomePage extends StatelessWidget {

  final ProductController productController=Get.put(ProductController());
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined),),
        ],
      ),
   body:Column(children: [
     /*first portion start here*/
     Row(children: [
       Expanded(
         child: Text(
           'ShopX',
           style: TextStyle(
               fontFamily: 'avenir',
               fontSize: 32,
               fontWeight: FontWeight.w900),
         ),
       ),
       IconButton(
           icon: Icon(Icons.view_list_rounded), onPressed: () {}),
       IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
     ],),
     /*first portion end here*/
     /*second portion start here*/
Expanded(child: Obx((){
  if(productController.isLoading.value){
    return Center(child: CircularProgressIndicator(),);
  }
  else {
    return
      GridView.builder(
          itemCount: productController.productItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return ProductItemsDisplay(
                product: productController.productItems[index]);
          });
  }
}),
)  ,

     /*second portion end here*/
   ],),
    );
  }
}
/*ProductItemsDisplay start here*/


class ProductItemsDisplay extends StatelessWidget {
  final Product product;
  const ProductItemsDisplay({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(
                    product.image,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              maxLines: 2,

              overflow: TextOverflow
                  .ellipsis, // if the title is more then two line it show ... ,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                  child: Row(
                    children: [
                      Text(
                        product.rating.rate.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Text(
                  product.category.name.toLowerCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "\$${product.price}",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
/*ProductItemsDisplay end here*/