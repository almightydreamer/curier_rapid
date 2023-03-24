import 'package:data/core/api_constants.dart';
import 'package:data/core/api_service.dart';
import 'package:dio/dio.dart';

class ApiDataSource {
  Future<BaseResponse> getSomething() async {
    return ApiService().getApiResponse(url: ApiConstants.baseUrl, apiMethod: ApiMethods.GET);
  }
}
