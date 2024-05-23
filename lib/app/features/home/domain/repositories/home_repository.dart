import 'package:dicionario/app/core/errors/base_exception.dart';
import 'package:either_dart/either.dart';

import '../entities/word_entity.dart';

abstract class HomeRepository {
  Future<Either<BaseException, List<WordEntity>>> fetchWords();
}
