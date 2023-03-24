abstract class RequestEvents {
  void startRequest();

  void finishRequest();

  void errorRequest(Map<String, dynamic>? errors, int? httpCode);

}