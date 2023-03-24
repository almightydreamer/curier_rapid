import 'dart:io';

import 'package:dio/dio.dart';
import 'package:domain/core/request/request_events.dart';

enum ApiMethods { GET, POST, PUT, DELETE, PATCH }

class ApiService {
  Dio baseDio = Dio();

  Future<BaseResponse> getApiResponse({
    RequestEvents? requestEvents,
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    required ApiMethods apiMethod,
  }) async {
    CancelToken cancelToken = CancelToken();
    int? responseCode;
    dynamic data;
    BaseResponse? responseData;

    if(requestEvents != null) requestEvents.startRequest();

    try {
      Response response;
      switch (apiMethod) {
        case ApiMethods.GET:
          response = await baseDio.get(
            url,
            queryParameters: params,
            cancelToken: cancelToken,
          );
          break;
        case ApiMethods.POST:
          response = await baseDio.post(url,
              data: params, cancelToken: cancelToken);
          print("ON REQUEST FINISHED POST");
          break;
        case ApiMethods.DELETE:
          response = await baseDio.delete(url, data: params, cancelToken: cancelToken);
          break;
        case ApiMethods.PUT:
          response = await baseDio.put(url, data: params, cancelToken: cancelToken);
          break;
        case ApiMethods.PATCH:
          response = await baseDio.patch(url, data: params, cancelToken: cancelToken);
          break;
      }

      responseCode = response.statusCode!;
      data = response.data;

    } catch (exception) {
      if (exception is DioError) {
        if (exception.type == DioErrorType.response || exception.type == DioErrorType.other) {
          print('RequestError => dioError ${exception.response}');
        }
      } else {
        print('RequestError => otherError ${exception}');
      }
    }  finally {
      responseData = BaseResponse(data: data, code: responseCode);
    }

    if(requestEvents != null) requestEvents.finishRequest();

    return responseData;
  }
}

class BaseResponse {
  final int? code;
  final dynamic data;

  BaseResponse({
    required this.code,
    this.data,
  });
}
