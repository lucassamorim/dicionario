import 'dart:convert';

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
    //try {
    final response = await cache.get('words', 'name = ?', [word]);

    // final responLocalTeste = await cache.get('words', '', []);
    // print(responLocalTeste);

    if (response.isNotEmpty) {
      if (response[0].containsKey('name') &&
          response[0].containsKey('script') &&
          response[0].containsKey('favorite')) {
        final Map<String, dynamic> wordMap = response[0];
        print('<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>');
        //final convertMap = json.decode(response[0].toString());
        //print(response[0]['script']);
        //print(response[0]['script'].runtimeType);

        print('Aqui vão os detalhes');
        // final Map<String, dynamic> wordMap =
        //     response[0]['script'] as Map<String, dynamic>;
        //final wordMap = jsonDecode(response[0]['script'].toString());
        // final Map<String, dynamic> scriptMap = jsonDecode(wordMap['script']);
        // print(scriptMap);

        print(wordMap['script']['word']);

        //String script = response[0]['script'];

        print('<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>');
        return Right(WordDetailsAdapter.fromMap(
            response[0]['script'] as Map<String, dynamic>));
      }
    }

    return Left(DefaultException(
        message:
            'Não foi encontrado nenhum resultado no cache para essa busca.'));
    // } catch (e) {
    //   return Left(DefaultException(message: e.toString()));
    // }
  }

  @override
  Future<Either<BaseException, WordDetailsEntity>> saveWord(
      WordDetailsEntity word) async {
    try {
      final response = await cache.insert('words', {
        'name': word.word,
        'favorite': 0,
        'script': WordDetailsAdapter.toMap(word).toString()
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
