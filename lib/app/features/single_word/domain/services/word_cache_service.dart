import 'package:either_dart/either.dart';

import '../../../../core/errors/base_exception.dart';
import '../entities/word_details_entity.dart';

abstract class WordCacheService {
  Future<Either<BaseException, WordDetailsEntity>> fetchWord(String word);
  Future<Either<BaseException, WordDetailsEntity>> saveWord(
      WordDetailsEntity word);
}
