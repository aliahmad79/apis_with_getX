import 'package:api_with_getx/repository/product_repo.dart';
import 'package:api_with_getx/services/dio_service/dio_services.dart';
import 'package:get/get.dart';

class ProductController2 extends GetxController {
  final ProductRepo _productRepo = ProductRepo(DioClientServices());

  final productList = [].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    isLoading(true);
    final data = await _productRepo.getProducts();
    print(data.toString());
    if (data != null) {
      isLoading(false);
      productList.value = data;
    } else {
      isLoading(false);
    }
  }
}
