import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import '../../../../core/errors/base_exception.dart';
import '../../../../core/errors/default_exception.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<BaseException, List<WordEntity>>> fetchWords() async {
    try {
      List<WordEntity> words = [];
      final String response =
          await rootBundle.loadString('assets/json/words_dictionary.json');
      final Map<String, dynamic> data = json.decode(response);

      data.forEach(
        (key, value) {
          words.add(WordEntity(word: key));
        },
      );
      return Right(words);
    } catch (e) {
      return Left(DefaultException(message: e.toString()));
    }
  }
}
