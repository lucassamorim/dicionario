import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none);

ThemeData lightTheme(BuildContext context) => ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF3699FF),
        secondary: Color(0xFF090A0D),
        tertiary: Color(0xFFF8285A),
        error: Color(0xFFF8285A),
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      inputDecorationTheme:  InputDecorationTheme(
          filled: true,
          errorStyle: const TextStyle(
            color: Color(0xFFF8285A),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          fillColor: Colors.grey[300],
          labelStyle: const TextStyle(
            color:  Color(0xFF4B5675),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          border: _defaultInputBorder,
          focusedBorder: _defaultInputBorder,
          enabledBorder: _defaultInputBorder,
          errorBorder: _defaultInputBorder),
      textTheme: TextTheme(
        displayLarge:
            GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        displayMedium:
            GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        displaySmall:
            GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400),
        headlineLarge:
            GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
        headlineMedium:
            GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        headlineSmall:
            GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
        titleLarge:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700),
        titleMedium:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        titleSmall:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
        bodyLarge:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700),
        bodyMedium:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        bodySmall:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
        labelLarge:
            GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700),
        labelMedium:
            GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
        labelSmall:
            GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),
      ),
      extensions: const [
        CustomColors(
            backgroundPrimary: Color(0xFFF9F9F9),
            backgroundSecondary: Color(0xFF090A0D),
            textColor1: Color(0xFF071437),
            textColor2: Color(0xFF4B5675),
            textColor3: Color(0xFF99A1B7),
            backgroundError: Color(0xFFFFEEF3),
            backgroundSuccess: Color(0xFFDFFFEA),
            textSuccess: Color(0xFF17C653)),
      ],
    );

class CustomColors extends ThemeExtension<CustomColors> {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color textColor1;
  final Color textColor2;
  final Color textColor3;
  final Color backgroundSuccess;
  final Color backgroundError;
  final Color textSuccess;

  const CustomColors({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.textColor1,
    required this.textColor2,
    required this.textColor3,
    required this.backgroundSuccess,
    required this.backgroundError,
    required this.textSuccess,
  });

  @override
  CustomColors copyWith({
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? textColor1,
    Color? textColor2,
    Color? textColor3,
    Color? backgroundSuccess,
    Color? backgroundError,
    Color? textSuccess,
  }) {
    return CustomColors(
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      textColor1: textColor1 ?? this.textColor1,
      textColor2: textColor2 ?? this.textColor2,
      textColor3: textColor3 ?? this.textColor3,
      backgroundSuccess: backgroundSuccess ?? this.backgroundSuccess,
      backgroundError: backgroundError ?? this.backgroundError,
      textSuccess: textSuccess ?? this.textSuccess,
    );
  }

  static CustomColors of(BuildContext context) {
    return Theme.of(context).extension<CustomColors>()!;
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      textColor1: Color.lerp(textColor1, other.textColor1, t)!,
      textColor2: Color.lerp(textColor2, other.textColor2, t)!,
      textColor3: Color.lerp(textColor3, other.textColor3, t)!,
      backgroundSuccess:
          Color.lerp(backgroundSuccess, other.backgroundSuccess, t)!,
      backgroundError: Color.lerp(backgroundError, other.backgroundError, t)!,
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t)!,
    );
  }
}
