import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/appointment_provider.dart';
import '../widgets/appointment_card.dart';
import '../utils/app_colors.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: false,
        title: Text(
          'My Schedule',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Theme.of(context).textTheme.titleLarge?.color,
            letterSpacing: -0.5,
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textMuted,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4,
          dividerColor: Colors.transparent,
          indicatorColor: AppColors.primary,
          labelPadding: const EdgeInsets.symmetric(vertical: 12),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(width: 4, color: AppColors.primary),
            borderRadius: BorderRadius.circular(2),
            insets: const EdgeInsets.symmetric(horizontal: 16),
          ),
          tabs: const [Text('UPCOMING'), Text('COMPLETED'), Text('HISTORY')],
        ),
      ),
      body: Consumer<AppointmentProvider>(
        builder: (context, provider, child) {
          return TabBarView(
            controller: _tabController,
            physics: const ClampingScrollPhysics(),
            children: [
              _buildList(provider.upcomingAppointments, provider, true),
              _buildList(provider.completedAppointments, provider, false),
              _buildList(provider.historyAppointments, provider, false),
            ],
          );
        },
      ),
    );
  }

  Widget _buildList(
    List<dynamic> list,
    AppointmentProvider provider,
    bool isUpcoming,
  ) {
    if (list.isEmpty) {
      return _EmptyState(
        icon: isUpcoming ? Icons.calendar_today_rounded : Icons.history_rounded,
        message: isUpcoming ? 'No upcoming visits' : 'No history found',
      ).animate().fadeIn().scale(begin: const Offset(0.9, 0.9));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      physics: const ClampingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: AppointmentCard(
            appointment: item,
            onCancel: isUpcoming && item.status == 'upcoming'
                ? () => _showCancelDialog(context, provider, item.id)
                : null,
          ),
        ).animate(delay: (index * 100).ms).fadeIn().slideY(begin: 0.2);
      },
    );
  }

  void _showCancelDialog(
    BuildContext context,
    AppointmentProvider provider,
    String id,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        title: const Text(
          'Cancel Visit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure you want to cancel this appointment? This action cannot be undone.',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            height: 1.5,
          ),
        ),
        actionsPadding: const EdgeInsets.all(20),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Go Back',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              provider.cancelAppointment(id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Appointment Cancelled'),
                  backgroundColor: AppColors.warning,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'Cancel Visit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  const _EmptyState({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: Theme.of(context).brightness == Brightness.dark
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : AppColors.softShadow,
            ),
            child: Icon(
              icon,
              size: 56,
              color: AppColors.primary.withValues(alpha: 0.2),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            message,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Keep regular checkups to stay healthy.\nBook your next visit anytime.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
