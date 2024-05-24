import 'package:dicionario/app/core/http_client/dio/dio_client_impl.dart';
import 'package:dicionario/app/core/http_client/http_client.dart';
import 'package:dicionario/app/features/single_word/data/repositories/word_repository_impl.dart';
import 'package:dicionario/app/features/single_word/domain/repositories/word_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  late Client client;
  late WordRepository repository;
  setUp(() {
    dio = DioFactory.dio();
    client = DioClientImpl(dio: dio);
    repository = WordRepositoryImpl(client: client);
  });
  test('word repository impl ...', () async {
    final response = await repository.fetchWord('word');

    response.fold((l) {
      print(l.message);
    }, (r) {});
  });
}
