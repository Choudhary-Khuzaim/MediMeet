import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<Map<String, dynamic>> todayNotifications = [
      {
        'title': l10n.appointmentConfirmedTitle,
        'subtitle': l10n.appointmentConfirmedSub,
        'time': l10n.twoHoursAgo,
        'icon': Icons.calendar_today_rounded,
        'color': AppColors.primary,
        'isUnread': true,
        'type': 'appointment',
      },
      {
        'title': l10n.medicineReminderTitle,
        'subtitle': l10n.medicineReminderSub,
        'time': l10n.fiveHoursAgo,
        'icon': Icons.medical_services_rounded,
        'color': AppColors.secondary,
        'isUnread': true,
        'type': 'medicine',
      },
    ];

    final List<Map<String, dynamic>> earlierNotifications = [
      {
        'title': l10n.systemUpdateTitle,
        'subtitle': l10n.systemUpdateSub,
        'time': l10n.oneDayAgo,
        'icon': Icons.system_update_rounded,
        'color': Colors.orange,
        'isUnread': false,
        'type': 'system',
      },
      {
        'title': l10n.healthTipTitle,
        'subtitle': l10n.healthTipSub,
        'time': l10n.twoDaysAgo,
        'icon': Icons.lightbulb_outline_rounded,
        'color': Colors.blue,
        'isUnread': false,
        'type': 'tip',
      },
    ];

    final List<Map<String, dynamic>> allNotifications = [
      ...todayNotifications,
      ...earlierNotifications,
    ];
    final int unreadCount = allNotifications
        .where((n) => n['isUnread'] == true)
        .length;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          l10n.notifications,
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              l10n.markAllRead,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: (todayNotifications.isEmpty && earlierNotifications.isEmpty)
          ? _buildEmptyState(context, l10n)
          : CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                if (todayNotifications.isNotEmpty)
                  _buildSectionHeader(context, l10n.todayLabel, unreadCount, l10n),
                if (todayNotifications.isNotEmpty)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildNotificationCard(
                        context,
                        todayNotifications[index],
                        index,
                      ),
                      childCount: todayNotifications.length,
                    ),
                  ),
                if (earlierNotifications.isNotEmpty)
                  _buildSectionHeader(context, l10n.earlierLabel, 0, l10n),
                if (earlierNotifications.isNotEmpty)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildNotificationCard(
                        context,
                        earlierNotifications[index],
                        index + todayNotifications.length,
                      ),
                      childCount: earlierNotifications.length,
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
              ],
            ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    int unreadCount,
    AppLocalizations l10n,
  ) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            if ((title == 'Today' || title == l10n.todayLabel) && unreadCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  l10n.unreadNotificationsCount(unreadCount),
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    Map<String, dynamic> notification,
    int index,
  ) {
    final bool isUnread = notification['isUnread'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child:
          Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: AppColors.softShadow,
                  border: isUnread
                      ? Border.all(
                          color: AppColors.primary.withOpacity(0.1),
                          width: 1,
                        )
                      : Border.all(color: Colors.transparent, width: 1),
                ),
                child: Stack(
                  children: [
                    if (isUnread)
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: notification['color'].withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              notification['icon'],
                              color: notification['color'],
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      notification['title'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: isUnread
                                            ? FontWeight.bold
                                            : FontWeight.w600,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.titleMedium?.color,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  notification['subtitle'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color
                                        ?.withOpacity(0.7),
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  notification['time'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(duration: 400.ms, delay: (index * 100).ms)
              .slideX(
                begin: 0.05,
                end: 0,
                curve: Curves.easeOutQuad,
                delay: (index * 100).ms,
              ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 80,
              color: AppColors.primary.withOpacity(0.4),
            ),
          ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
          const SizedBox(height: 24),
          Text(
            l10n.allCaughtUp,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: 12),
          Text(
            l10n.noNewNotifications,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).textTheme.bodyMedium?.color,
              height: 1.5,
            ),
          ).animate().fadeIn(delay: 500.ms),
        ],
      ),
    );
  }
}
