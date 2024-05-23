import '../errors/base_exception.dart';
import 'rest_client_response.dart';

class RestClientException extends BaseException {
  dynamic error;
  RestClientResponse? response;

  RestClientException({
    required super.message,
    super.statusCode,
    super.data,
    required this.error,
    this.response,
    super.stackTracing,
  });
}
