import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Appointment Confirmed',
        'subtitle':
            'Your appointment with Dr. Sarah Khan is confirmed for tomorrow at 10:00 AM.',
        'time': '2h ago',
        'icon': Icons.calendar_today_rounded,
        'color': AppColors.primary,
        'isUnread': true,
      },
      {
        'title': 'Medicine Reminder',
        'subtitle': 'It\'s time to take your morning dosage of Panadol.',
        'time': '5h ago',
        'icon': Icons.medical_services_rounded,
        'color': AppColors.secondary,
        'isUnread': true,
      },
      {
        'title': 'System Update',
        'subtitle':
            'New features have been added to your MediMeet app. Check them out!',
        'time': '1d ago',
        'icon': Icons.system_update_rounded,
        'color': Colors.orange,
        'isUnread': false,
      },
      {
        'title': 'Health Tip',
        'subtitle':
            'Drinking 8 glasses of water a day keeps you hydrated and active.',
        'time': '2d ago',
        'icon': Icons.lightbulb_outline_rounded,
        'color': Colors.blue,
        'isUnread': false,
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_all_rounded, size: 20),
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 80,
                    color: AppColors.textMuted.withValues(alpha: 0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications yet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'We\'ll notify you when something\nimportant happens.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child:
                      Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.03),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              border: notification['isUnread']
                                  ? Border.all(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.1,
                                      ),
                                      width: 1.5,
                                    )
                                  : null,
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              leading: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: notification['color'].withValues(
                                    alpha: 0.1,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  notification['icon'],
                                  color: notification['color'],
                                  size: 22,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      notification['title'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: notification['isUnread']
                                            ? FontWeight.bold
                                            : FontWeight.w600,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.titleMedium?.color,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    notification['time'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(
                                        context,
                                      ).textTheme.bodySmall?.color,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  notification['subtitle'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.color,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(delay: (index * 100).ms)
                          .slideX(begin: 0.1),
                );
              },
            ),
    );
  }
}
