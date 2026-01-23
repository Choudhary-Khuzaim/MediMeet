import 'package:flutter/material.dart';

class AppColors {
  // Sophisticated modern palette
  static const Color primary = Color(0xFF2D5AF0); // Modern Indigo
  static const Color primaryDark = Color(0xFF1A3BB5);
  static const Color primaryLight = Color(0xFFE9EFFF);

  static const Color secondary = Color(0xFF00CBA9); // Premium Teal
  static const Color secondaryDark = Color(0xFF00A88D);
  static const Color secondaryLight = Color(0xFFE0F9F4);

  static const Color accent = Color(0xFFFFB347); // Sophisticated Amber
  static const Color accentDark = Color(0xFFF39C12);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2D5AF0), Color(0xFF6E8EFB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF00CBA9), Color(0xFF4EE3AA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFFB347), Color(0xFFFFCC33)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Neutrals - refined for high-end look
  static const Color background = Color(0xFFF6F9FF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF1F5F9);

  // Text colors with better contrast
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);

  // Status
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Borders & dividers
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);

  // High-fidelity Shadows
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.03),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.02),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.08),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];

  static Color shadowColor = const Color(0xFF000000).withValues(alpha: 0.05);
}
