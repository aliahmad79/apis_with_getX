import 'dart:convert';
import 'dart:developer';

import 'package:api_with_getx/constant/constant.dart';
import 'package:api_with_getx/services/exceptions/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpServices {
  static var client = http.Client();

  static Future<Response> get(String endPoint) async {
    try {
      final response =
          await client.get(Uri.parse(AppConstant.baseUrl + endPoint));
      // return response;
      return returnResponse(response);
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

  static dynamic returnResponse(response) {
    // dynamic data = jsonDecode(response.body);
    log(response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        return response; // Return the parsed JSON data.
      case 400:
        throw BadRequestException(["errors"].toString());
      case 401:
        throw UnauthorizedException("Unauthorized");
      case 403:
        throw ForbiddenException("Credentials do not match");
      case 404:
        throw NotFoundException("Not found");
      default:
        throw FetchDataException(
            "Error occurred while communicating with the server with status code ${response.statusCode.toString()}");
    }
  }
}
