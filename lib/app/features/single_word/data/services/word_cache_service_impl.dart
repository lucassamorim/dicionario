import 'dart:convert';

import 'package:either_dart/either.dart';

import '../../../../core/cache/cache.dart';
import '../../../../core/errors/base_exception.dart';
import '../../../../core/errors/default_exception.dart';
import '../../domain/entities/word_details_entity.dart';
import '../../domain/services/word_cache_service.dart';
import '../adapters/word_details_adapter.dart';

class WordCacheServiceImpl implements WordCacheService {
  final Cache cache;
  WordCacheServiceImpl({
    required this.cache,
  });

  @override
  Future<Either<BaseException, WordDetailsEntity>> fetchWord(
      String word) async {
    try {
      final response = await cache.get('words', 'name = ?', [word]);

      if (response.isNotEmpty) {
        if (response[0].containsKey('name') &&
            response[0].containsKey('script') &&
            response[0].containsKey('favorite')) {
          final Map<String, dynamic> wordMap = response[0];
          return Right(
              WordDetailsAdapter.fromMap(jsonDecode(wordMap['script'])));
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
      final response = await cache.insert('words', {
        'name': word.word,
        'favorite': 0,
        'script': jsonEncode(WordDetailsAdapter.toMap(word))
      });
      if (response) return Right(word);
      return Left(DefaultException(
          message:
              'Não foi possível salvar os detalhtes da palavra no cache. Por favor, tente novamente.'));
    } catch (e) {
      return Left(DefaultException(message: e.toString()));
    }
  }
}
