import 'package:dio/dio.dart';

import '../rest_client_exception.dart';
import '../rest_client_request.dart';
import '../rest_client_response.dart';

class DioAdapter {
  static RestClientException toClientException(DioException dioException) {
    return RestClientException(
      error: dioException.error,
      message: dioException.message ?? '',
      data: dioException.response?.data ?? {},
      response: dioException.response == null
          ? null
          : toClientResponse(dioException.response!),
      statusCode: dioException.response?.statusCode,
    );
  }

  static RestClientResponse toClientResponse(Response response) {
    return RestClientResponse(
      request: toClientRequest(response.requestOptions),
      message: response.statusMessage,
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  static RestClientRequest toClientRequest(RequestOptions request) {
    return RestClientRequest(
      path: request.path,
      method: request.method,
      headers: request.headers,
      queryParameters: request.queryParameters,
      data: request.data,
      baseUrl: request.baseUrl,
    );
  }
}
