import 'package:api_with_getx/constant/constant.dart';
import 'package:api_with_getx/model/product_model.dart';
import 'package:api_with_getx/services/http_service/http_services.dart';

class HomeRepo {
  static Future<List<Product>?> fetchProducts() async {
    var response = await HttpServices.get(AppConstant.endPoint);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }

  Future postProduct(Map<String, dynamic> productData) async {
    final response = await HttpServices.post('/products',
        data: productData); // Replace with your API endpoint
    return response;
  }

  static Future postData(Map<String, dynamic> productData) async {
    var response = await HttpServices.post("https://reqres.in/api/users",
        data: productData);
    if (response.statusCode == 201) {
      print(response.body.toString());
      print("data successfully created");
      return response;
    } else {
      return null;
    }
  }
}
