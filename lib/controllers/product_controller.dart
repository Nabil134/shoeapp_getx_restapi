import 'package:fluttershoppingwithgetx/models/product_model.dart';
import 'package:fluttershoppingwithgetx/services/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var productItems=<Product>[].obs;
  var isLoading=true.obs;

  @override
  void onInit() {
    fetchProducts();
    // TODO: implement onInit
    super.onInit();
  }
   /**/
void fetchProducts() async{
  try{
    isLoading(true);
     var products= await RemoteServices.fetchProducts();
     if(products!=null){
       productItems.assignAll(products);
     }
  }
  finally{
    isLoading(false);

  }
}
/**/
}