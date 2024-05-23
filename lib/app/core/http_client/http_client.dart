import 'rest_client_request.dart';
import 'rest_client_response.dart';

abstract interface class Client {
  Future<RestClientResponse> post(RestClientRequest request);
  Future<RestClientResponse> get(RestClientRequest request);
  Future<RestClientResponse> put(RestClientRequest request);
  Future<RestClientResponse> delete(RestClientRequest request);
}
