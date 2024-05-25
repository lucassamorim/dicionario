import 'package:dicionario/app/core/errors/default_exception.dart';
import 'package:dicionario/app/features/single_word/data/adapters/word_details_adapter.dart';
import 'package:either_dart/either.dart';

import '../../../../core/cache/cache.dart';
import '../../../../core/errors/base_exception.dart';
import '../../domain/entities/word_details_entity.dart';
import '../../domain/services/word_cache_service.dart';

class WordCacheServiceImpl implements WordCacheService {
  final Cache cache;
  WordCacheServiceImpl({
    required this.cache,
  });

  @override
  Future<Either<BaseException, WordDetailsEntity>> fetchWord(
      String word) async {
    try {
      final response = await cache.get('works', 'name = ?', [word]);
      if (response.isNotEmpty) {
        if (response[0].containsKey('name') &&
            response[0].containsKey('script') &&
            response[0].containsKey('favorite')) {
          return Right(WordDetailsAdapter.fromMap(response[0]));
        }
      }

      return Left(DefaultException(
          message:
              'Não foi encontrado nenhum resultado no cache para essa busca.'));
    } catch (e) {
      return Left(DefaultException(message: e.toString()));
    }
  }

  @override
  Future<Either<BaseException, WordDetailsEntity>> saveWord(
      WordDetailsEntity word) async {
    try {
      final response =
          await cache.insert('word', WordDetailsAdapter.toMap(word));
      if (response) return Right(word);
      return Left(DefaultException(
          message:
              'Não foi possível salvar a palavra no cache. Por favor, tente novamente.'));
    } catch (e) {
      return Left(DefaultException(message: e.toString()));
    }
  }
}
