import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  late int _errorCode;
  String _errorMessage = "";

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }
  ServerError.withConnectionError() {
    _handleConnectionError();
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleConnectionError() {
    _errorMessage = 'No Internet Connection';
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.unknown:
        _errorMessage = "Server Connection Failed";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.badResponse:
        _errorMessage =
            "Received invalid status code: ${error.response!.statusCode} and msg : ${error.response!.statusMessage}";
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
      default:
        _errorMessage = "No Internet Connection";
        break;
    }

    return _errorMessage;
  }
}
