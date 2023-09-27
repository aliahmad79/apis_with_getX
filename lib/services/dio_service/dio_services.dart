import 'package:api_with_getx/constant/constant.dart';
import 'package:dio/dio.dart';

class DioClientServices {
  final Dio _dio = Dio();

  DioClientServices() {
    _dio
      ..options.baseUrl = AppConstant.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30);
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw DioException(
        error: 'Failed to perform GET request',
        requestOptions: RequestOptions(path: endpoint),
      );
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      throw DioException(
        error: 'Failed to perform POST request',
        requestOptions: RequestOptions(path: endpoint),
      );
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      throw DioException(
        error: 'Failed to perform PUT request',
        requestOptions: RequestOptions(path: endpoint),
      );
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response;
    } catch (e) {
      throw DioException(
        error: 'Failed to perform DELETE request',
        requestOptions: RequestOptions(path: endpoint),
      );
    }
  }
}
