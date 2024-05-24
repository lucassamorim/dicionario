import 'package:dicionario/app/features/single_word/data/adapters/phonetic_adapter.dart';
import 'package:dicionario/app/features/single_word/domain/entities/word_details_entity.dart';

import '../../domain/entities/meaning_entity.dart';
import '../../domain/entities/phonetics_entity.dart';
import 'meaning_adapter.dart';

class WordDetailsAdapter {
  static WordDetailsEntity fromMap(Map<String, dynamic> json) {
    List<PhoneticEntity> phonetics = (json['phonetics'] as List)
        .map((phonetic) => PhoneticAdapter.fromMap(phonetic))
        .toList();

    List<MeaningEntity> meanings = (json['meanings'] as List)
        .map((meaning) => MeaningAdapter.fromMap(meaning))
        .toList();

    return WordDetailsEntity(
        word: json['word'] ?? '', phonetics: phonetics, meanings: meanings);
  }
}
