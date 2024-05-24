import '../../domain/entities/meaning_entity.dart';
import 'definition_adapter.dart';

class MeaningAdapter {
  static MeaningEntity fromMap(Map<String, dynamic> map) {
    return MeaningEntity(
      partOfSpeech: map['partOfSpeech'] ?? '',
      definitions: map['definitions'] != null
          ? (map['definitions'] as List)
              .map((definition) => DefinitionAdapter.fromMap(definition))
              .toList()
          : [],
      antonyms: map['antonyms'] != null
          ? (map['antonyms'] as List)
              .map((antonym) => antonym.toString())
              .toList()
          : [],
      synonyms: map['synonyms'] != null
          ? (map['synonyms'] as List)
              .map((synonym) => synonym.toString())
              .toList()
          : [],
    );
  }
}
