import '../../domain/entities/definition_entity.dart';

class DefinitionAdapter {
  static DefinitionEntity fromMap(Map<String, dynamic> map) {
    return DefinitionEntity(
        definition: map['definition'] ?? '',
        synonyms: map['synonyms'] != null
            ? (map['synonyms'] as List)
                .map((synonym) => synonym.toString())
                .toList()
            : [],
        antonyms: map['antonyms'] != null
            ? (map['antonyms'] as List)
                .map((antonym) => antonym.toString())
                .toList()
            : []);
  }
}
