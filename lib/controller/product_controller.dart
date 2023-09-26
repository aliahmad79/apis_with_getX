import 'package:api_with_getx/model/product_model.dart';
import 'package:api_with_getx/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var data = await RemoteServices.fetchProducts();
      if (data != null) {
        productList.value = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
