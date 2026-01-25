import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/auth_provider.dart';
import '../utils/app_colors.dart';
import '../screens/profile_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/appointments_screen.dart';
import '../screens/medical_records_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/help_center_screen.dart';
import '../screens/about_app_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final String userName = authProvider.userName ?? 'User';
    final String userEmail = authProvider.userEmail ?? 'user@example.com';

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      width: MediaQuery.of(context).size.width * 0.82,
      child:
          Column(
                children: [
                  // Professional Branding & Profile Section
                  Container(
                    padding: const EdgeInsets.fromLTRB(28, 70, 24, 32),
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Branded Logo (Matches HomeScreen Style)
                        Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Medi',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.primary,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Meet',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(
                                            context,
                                          ).textTheme.titleLarge?.color,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: AppColors.secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            )
                            .animate()
                            .fadeIn(duration: 600.ms)
                            .slideX(begin: -0.2),
                        const SizedBox(height: 32),

                        // User Profile Header
                        Row(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  userName[0].toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ).animate().scale(
                              duration: 600.ms,
                              curve: Curves.easeOutBack,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child:
                                  Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            userName,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(
                                                context,
                                              ).textTheme.titleLarge?.color,
                                              letterSpacing: -0.4,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            userEmail,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium?.color,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      )
                                      .animate()
                                      .fadeIn(delay: 200.ms)
                                      .slideX(begin: 0.1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Menu Items Section
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      physics: const ClampingScrollPhysics(),
                      children: [
                        _drawerItem(
                          context,
                          icon: Icons.person_outline_rounded,
                          label: 'Account Profile',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                          index: 0,
                        ),
                        _drawerItem(
                          context,
                          icon: Icons.notifications_none_rounded,
                          label: 'Notifications',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationsScreen(),
                              ),
                            );
                          },
                          index: 1,
                          badge: '2',
                        ),
                        _drawerItem(
                          context,
                          icon: Icons.calendar_today_rounded,
                          label: 'My Appointments',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AppointmentsScreen(),
                              ),
                            );
                          },
                          index: 2,
                        ),
                        _drawerItem(
                          context,
                          icon: Icons.history_edu_rounded,
                          label: 'Medical Records',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MedicalRecordsScreen(),
                              ),
                            );
                          },
                          index: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          child: Divider(
                            color: Theme.of(context).dividerColor,
                            thickness: 0.8,
                          ),
                        ),
                        _drawerItem(
                          context,
                          icon: Icons.settings_outlined,
                          label: 'Settings',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                          index: 4,
                        ),
                        _drawerItem(
                          context,
                          icon: Icons.help_outline_rounded,
                          label: 'Help & Support',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpCenterScreen(),
                              ),
                            );
                          },
                          index: 5,
                        ),
                        _drawerItem(
                          context,
                          icon: Icons.info_outline_rounded,
                          label: 'About MediMeet',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutAppScreen(),
                              ),
                            );
                          },
                          index: 6,
                        ),
                      ],
                    ),
                  ),

                  // Clean Logout Section
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        authProvider.logout();
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.error.withValues(alpha: 0.2),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: AppColors.error,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Sign Out',
                              style: TextStyle(
                                color: AppColors.error,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
                ],
              )
              .animate()
              .fadeIn(duration: 400.ms)
              .scale(
                begin: const Offset(0.95, 0.95),
                curve: Curves.easeOutCubic,
              ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required int index,
    String? badge,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        onTap: onTap,
        dense: true,
        leading: Icon(
          icon,
          color: Theme.of(context).textTheme.bodyMedium?.color,
          size: 22,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.titleSmall?.color,
          ),
        ),
        trailing: badge != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: AppColors.textMuted,
              ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        hoverColor: AppColors.primaryLight,
      ).animate(delay: (index * 50).ms).fadeIn().slideX(begin: 0.05),
    );
  }
}
