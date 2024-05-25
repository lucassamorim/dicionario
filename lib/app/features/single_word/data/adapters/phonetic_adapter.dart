import '../../domain/entities/phonetics_entity.dart';

class PhoneticAdapter {
  static PhoneticEntity fromMap(Map<String, dynamic> map) {
    return PhoneticEntity(
      audio: map['audio'] ?? '',
      text: map['text'] ?? '',
      licenseName: map['license'] != null ? map['license']['name'] : '',
      licenceUrl: map['licence'] != null ? map['license']['url'] : '',
    );
  }

  static Map<String, dynamic> toMap(PhoneticEntity phonetic) {
    return {
      'audio': phonetic.audio,
      'text': phonetic.text,
    };
  }
}
