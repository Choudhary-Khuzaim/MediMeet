import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('About MediMeet')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Logo Section
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.medical_services_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ).animate().scale(
                    duration: 600.ms,
                    curve: Curves.easeOutBack,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'MediMeet',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimary,
                      letterSpacing: -1,
                    ),
                  ).animate().fadeIn(delay: 200.ms),
                  const Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(delay: 300.ms),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Description Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Text(
                      'Your Global Healthcare Partner',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'MediMeet is a state-of-the-art healthcare platform designed to bridge the gap between patients and medical professionals. Our mission is to provide accessible, affordable, and high-quality healthcare services to everyone, everywhere.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
            ),

            const SizedBox(height: 32),

            // App Features Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What we offer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ).animate().fadeIn(delay: 500.ms),
                  const SizedBox(height: 16),
                  _buildFeatureTile(
                    icon: Icons.video_call_rounded,
                    title: 'Online Consultations',
                    description:
                        'Connect with top specialists via secure video calls.',
                    delay: 600,
                  ),
                  _buildFeatureTile(
                    icon: Icons.local_pharmacy_rounded,
                    title: 'Digital Pharmacy',
                    description:
                        'Order genuine medicines with fast home delivery.',
                    delay: 700,
                  ),
                  _buildFeatureTile(
                    icon: Icons.folder_shared_rounded,
                    title: 'Secure Health Records',
                    description:
                        'Keep your medical history safe and accessible.',
                    delay: 800,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Footer Info
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                '© 2026 MediMeet. All rights reserved.',
                style: TextStyle(fontSize: 14, color: AppColors.textMuted),
              ),
            ).animate().fadeIn(delay: 1000.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required String description,
    required int delay,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms).slideX(begin: 0.05);
  }
}
