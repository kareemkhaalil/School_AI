import 'package:dio/dio.dart';
import 'package:school_ai/core/params/endpoints.dart';

class ApiServices {
  final Dio _dio = Dio();
  final String _baseUrl = Endpoints.baseUrl;

  Future<Map<String, dynamic>> post(
      String endPoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(_baseUrl + endPoint, data: data);
      // Check status code
      if (response.statusCode == 200) {
        // Return parsed response data
        return response.data;
      } else {
        // Handle error response
        throw DioException(
            response: response,
            error: 'Failed to post data',
            requestOptions: RequestOptions(path: endPoint));
      }
    } catch (e) {
      // Handle Dio errors
      throw DioException(
          requestOptions: RequestOptions(path: endPoint), error: e.toString());
    }
  }
}
