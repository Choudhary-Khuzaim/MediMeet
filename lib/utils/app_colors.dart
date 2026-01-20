import 'package:flutter/material.dart';

class AppColors {
  // Three-color professional palette
  static const Color primary = Color(0xFF1D3557); // Deep Navy
  static const Color primaryLight = Color(0xFF457B9D); // Medium Blue
  static const Color secondary = Color(0xFF00B4D8); // Sky Blue/Teal
  static const Color accent = Color(0xFFFFB703); // Warm Amber

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1D3557), Color(0xFF457B9D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFFB703), Color(0xFFFB8500)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Neutrals
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF1F5F9);

  // Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF94A3B8);

  // Status
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Borders & dividers
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);

  // Shadows
  static Color shadowColor = const Color(0xFF000000).withValues(alpha: 0.05);
  static Color shadowColorDark = const Color(0xFF000000).withValues(alpha: 0.1);
}
