import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import 'change_password_screen.dart';
import 'privacy_policy_screen.dart';
import 'terms_of_service_screen.dart';
import 'help_center_screen.dart';
import 'send_feedback_screen.dart';
import 'about_app_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  bool _reminderEnabled = true;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: true,
    );
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.settings)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Notifications Section
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: _SettingsSection(
                title: localizations.notifications,
                children: [
                  _SwitchTile(
                    icon: Icons.notifications_outlined,
                    title: 'Push Notifications',
                    subtitle: 'Receive push notifications',
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                  _SwitchTile(
                    icon: Icons.email_outlined,
                    title: 'Email Notifications',
                    subtitle: 'Receive email updates',
                    value: _emailNotifications,
                    onChanged: (value) {
                      setState(() {
                        _emailNotifications = value;
                      });
                    },
                  ),
                  _SwitchTile(
                    icon: Icons.sms_outlined,
                    title: 'SMS Notifications',
                    subtitle: 'Receive SMS updates',
                    value: _smsNotifications,
                    onChanged: (value) {
                      setState(() {
                        _smsNotifications = value;
                      });
                    },
                  ),
                  _SwitchTile(
                    icon: Icons.alarm_outlined,
                    title: 'Appointment Reminders',
                    subtitle: 'Get reminders before appointments',
                    value: _reminderEnabled,
                    onChanged: (value) {
                      setState(() {
                        _reminderEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // General Settings
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: _SettingsSection(
                title: localizations.general,
                children: [
                  _ListTile(
                    icon: Icons.language_rounded,
                    title: localizations.language,
                    subtitle: languageProvider.isUrdu ? 'اردو' : 'English',
                    onTap: () {
                      _showLanguageDialog(context, languageProvider);
                    },
                  ),
                  _ListTile(
                    icon: Icons.palette_outlined,
                    title: localizations.theme,
                    subtitle: themeProvider.isDarkMode
                        ? localizations.dark
                        : localizations.light,
                    onTap: () {
                      _showThemeDialog(context, themeProvider);
                    },
                  ),
                ],
              ),
            ),

            // Account Settings
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: _SettingsSection(
                title: 'Account',
                children: [
                  _ListTile(
                    icon: Icons.lock_outline_rounded,
                    title: localizations.changePassword,
                    subtitle: localizations.changePasswordSubtitle,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen(),
                        ),
                      );
                    },
                  ),
                  _ListTile(
                    icon: Icons.privacy_tip_outlined,
                    title: localizations.privacyPolicy,
                    subtitle: localizations.privacyIntro,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                  ),
                  _ListTile(
                    icon: Icons.description_outlined,
                    title: localizations.termsOfService,
                    subtitle: localizations.termsIntro,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsOfServiceScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Support Section
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: _SettingsSection(
                title: localizations.support,
                children: [
                  _ListTile(
                    icon: Icons.help_outline_rounded,
                    title: localizations.helpCenter,
                    subtitle: localizations.helpIntro,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpCenterScreen(),
                        ),
                      );
                    },
                  ),
                  _ListTile(
                    icon: Icons.feedback_outlined,
                    title: localizations.sendFeedback,
                    subtitle: localizations.feedbackSubtitle,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SendFeedbackScreen(),
                        ),
                      );
                    },
                  ),
                  _ListTile(
                    icon: Icons.info_outline_rounded,
                    title: 'About',
                    subtitle: 'App version 1.0.0',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutAppScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(
    BuildContext context,
    LanguageProvider languageProvider,
  ) {
    final localizations = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.selectLanguage,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            const SizedBox(height: 20),
            _LanguageOption(
              language: 'English',
              isSelected: !languageProvider.isUrdu,
              onTap: () async {
                await languageProvider.setLanguage('English');
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
            _LanguageOption(
              language: 'اردو (Urdu)',
              isSelected: languageProvider.isUrdu,
              onTap: () async {
                await languageProvider.setLanguage('اردو (Urdu)');
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showThemeDialog(BuildContext context, ThemeProvider themeProvider) {
    final localizations = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.selectTheme,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            const SizedBox(height: 20),
            _ThemeOption(
              theme: localizations.light,
              isSelected: !themeProvider.isDarkMode,
              onTap: () async {
                await themeProvider.setTheme(false);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
            _ThemeOption(
              theme: localizations.dark,
              isSelected: themeProvider.isDarkMode,
              onTap: () async {
                await themeProvider.setTheme(true);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: Theme.of(context).brightness == Brightness.dark
                  ? 0.2
                  : 0.05,
            ),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.titleMedium?.color,
                letterSpacing: -0.5,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary, size: 24),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: AppColors.primary,
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary, size: 24),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.textSecondary,
      ),
      onTap: onTap,
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        language,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          color: isSelected
              ? AppColors.primary
              : Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: AppColors.primary)
          : Icon(
              Icons.circle_outlined,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
      onTap: onTap,
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String theme;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.theme,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        theme,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          color: isSelected
              ? AppColors.primary
              : Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: AppColors.primary)
          : Icon(
              Icons.circle_outlined,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
      onTap: onTap,
    );
  }
}
