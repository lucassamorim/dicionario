import 'meaning_entity.dart';
import 'phonetics_entity.dart';

class WordDetailsEntity {
  final String word;
  final List<PhoneticEntity> phonetics;

  final List<MeaningEntity> meanings;

  WordDetailsEntity(
      {required this.word, required this.phonetics, required this.meanings});
}
