import 'dart:convert';

import 'package:api_with_getx/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpServices {
  static var client = http.Client();

  static Future<Response> get(String endPoint) async {
    try {
      final response =
          await client.get(Uri.parse(AppConstant.baseUrl + endPoint));
      return response;
    } catch (e) {
      throw e;
    }
  }

  static Future<Response> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await client.post(
        Uri.parse(endpoint),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // static Future<List<Product>?> fetchProducts() async {
  //   var response = await client.get(Uri.parse(
  //       "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     return productFromJson(jsonString);
  //   } else {
  //     return null;
  //   }
  // }
}
