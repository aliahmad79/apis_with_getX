import 'package:api_with_getx/model/product_model.dart';
import 'package:api_with_getx/repository/home_repo.dart';
// import 'package:api_with_getx/services/http_service/http_services.dart';
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
      var data = await HomeRepo.fetchProducts();
      if (data != null) {
        productList.value = data;
      }
    } finally {
      isLoading(false);
    }
  }

  void createProduct(Map<String, dynamic> productData) async {
    try {
      isLoading(true);
      var data = await HomeRepo.postData(productData);
    } finally {
      isLoading(false);
    }
  }
}
