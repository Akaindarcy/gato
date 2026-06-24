import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const _primaryColor = Color(0xFF2E7D32); // Green for growth
  static const _secondaryColor = Color(0xFF66BB6A);
  static const _errorColor = Color(0xFFD32F2F);
  static const _surfaceColor = Color(0xFFFAFAFA);
  static const _onboardingBg = Color(0xFFF1F8E9);
  static const _pictogramTint = Color(0xFF1B5E20);

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      primaryColor: _primaryColor,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        error: _errorColor,
        surface: _surfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black87,
        onSurface: Colors.black87,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      fontFamily: AppFonts.defaultFont,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87, height: 1.2),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87, height: 1.3),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
        bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black87, height: 1.5),
        bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black74, height: 1.5),
        bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54, height: 1.4),
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 0.5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 56),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.black12)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      iconTheme: const IconThemeData(size: 32, color: Colors.black87),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return base;
  }

  static ThemeData get onboarding {
    final base = light;
    return base.copyWith(
      scaffoldBackgroundColor: _onboardingBg,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        surface: _onboardingBg,
        onPrimary: Colors.white,
        onSurface: Colors.black87,
      ),
    );
  }

  static const pictogram = IconThemeData(size: 64, color: _pictogramTint);
  static const pictogramSmall = IconThemeData(size: 32, color: _pictogramTint);

  static void setSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

class AppFonts {
  static const defaultFont = 'Roboto';
  static const mono = 'monospace';
}
