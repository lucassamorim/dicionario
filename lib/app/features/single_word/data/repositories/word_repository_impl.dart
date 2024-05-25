import 'package:either_dart/either.dart';

import '../../../../core/constants/env.dart';
import '../../../../core/errors/default_exception.dart';
import '../../../../core/http_client/rest_client_request.dart';
import '../../domain/entities/word_details_entity.dart';
import '../../../../core/errors/base_exception.dart';
import '../../../../core/http_client/http_client.dart';
import '../../domain/repositories/word_repository.dart';
import '../adapters/word_details_adapter.dart';

class WordRepositoryImpl implements WordRepository {
  final Client client;
  WordRepositoryImpl({
    required this.client,
  });

  @override
  Future<Either<BaseException, WordDetailsEntity>> fetchWord(
      String word) async {
    try {
      final response =
          await client.get(RestClientRequest(path: "$baseUrl/$word"));

      if ((response.data as List).isNotEmpty) {
        if ((response.data[0] as Map<String, dynamic>).containsKey('word') &&
            (response.data[0] as Map<String, dynamic>)
                .containsKey('phonetics') &&
            (response.data[0] as Map<String, dynamic>)
                .containsKey('meanings')) {
          return Right(WordDetailsAdapter.fromMap(response.data[0]));
        }
      }
      return Left(DefaultException(
          message:
              'Não foi encontranda nenhuma palavra para essa busca. Por favor, tente novamente.'));
    } on BaseException catch (e) {
      if (e.data.containsKey('title') &&
          e.data.containsKey('message') &&
          e.data.containsKey('resolution')) {
        return Left(DefaultException(
            message: 'Por favor, insira uma palavra válida para a busca.'));
      }
      return Left(DefaultException(message: e.message));
    } catch (e) {
      return Left(DefaultException(message: e.toString()));
    }
  }
}
