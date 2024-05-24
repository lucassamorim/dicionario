class PhoneticEntity {
  final String audio;
  final String text;
  final String licenseName;
  final String licenceUrl;
  PhoneticEntity({
    required this.audio,
    required this.text,
    required this.licenseName,
    required this.licenceUrl,
  });

  PhoneticEntity copyWith({
    String? audio,
    String? text,
    String? licenseName,
    String? licenceUrl,
  }) {
    return PhoneticEntity(
      audio: audio ?? this.audio,
      text: text ?? this.text,
      licenseName: licenseName ?? this.licenseName,
      licenceUrl: licenceUrl ?? this.licenceUrl,
    );
  }
}
