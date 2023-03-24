import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:domain/core/request/request_events.dart';

class RequestBloc extends GetxController implements RequestEvents {
  final RequestEvents? _requestEvents;
  bool showLoading = true;

  RxBool statusLoading = false.obs;

  RequestBloc(this._requestEvents);

  @override
  void errorRequest(Map<String, dynamic>? errors, int? httpCode) {
    statusLoading.value = false;
    if (_requestEvents != null) _requestEvents!.errorRequest(errors, httpCode);
  }

  @override
  void startRequest() {
    statusLoading.value = true;
  }

  @override
  void finishRequest() {
    statusLoading.value = false;
  }
}
