import 'dart:convert';

import 'package:api_with_getx/constant/constant.dart';
import 'package:api_with_getx/model/product_model.dart';
import 'package:api_with_getx/services/dio_service/dio_services.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  final DioClientServices _dioClient;

  ProductRepo(this._dioClient);

  Future<List<Product>?> getProducts() async {
    final response = await _dioClient
        .get(AppConstant.endPoint); // Replace with your API endpoint

    if (response.statusCode == 200) {
      var jsonData = response.data;
      var jsonString = jsonEncode(jsonData);
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}
