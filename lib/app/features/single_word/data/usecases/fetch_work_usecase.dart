import 'package:dicionario/app/core/errors/default_exception.dart';
import 'package:either_dart/either.dart';

import '../../../../core/errors/base_exception.dart';
import '../../domain/entities/word_details_entity.dart';
import '../../domain/repositories/word_repository.dart';
import '../../domain/services/word_cache_service.dart';

class FetchWorkUsecase {
  final WordRepository repository;
  final WordCacheService service;
  FetchWorkUsecase({
    required this.repository,
    required this.service,
  });

  Future<Either<BaseException, WordDetailsEntity>> call(String word) async {
    final localResponse = await service.fetchWord(word);

    if (localResponse.isRight) {
      return localResponse;
    }

    final networkResponse = await repository.fetchWord(word);

    return networkResponse.fold(
      (l) => Left(DefaultException(message: l.message)),
      (r) async {
        await service.saveWord(r);
        return Right(r);
      },
    );
  }
}
