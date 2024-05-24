import '../../domain/entities/phonetics_entity.dart';

class PhoneticAdapter {
  static PhoneticEntity fromMap(Map<String, dynamic> map) {
    return PhoneticEntity(
      audio: map['audio'] ?? '',
      text: map['text'] ?? '',
      // licenseName: map['license']['name'] ?? '',
      // licenceUrl: map['licence']['url'] ?? '',
      licenseName: 'Teste licence name',
      licenceUrl: 'Teste licence url',
    );
  }
}
