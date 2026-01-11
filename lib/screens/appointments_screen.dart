import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      appBar: AppBar(
        title: const Text('My Appointments'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Completed'),
            Tab(text: 'All'),
          ],
        ),
      ),
      body: Consumer<AppointmentProvider>(
        builder: (context, appointmentProvider, child) {
          final upcoming = appointmentProvider.upcomingAppointments;
          final completed = appointmentProvider.completedAppointments;
          final all = appointmentProvider.appointments;

          return TabBarView(
            controller: _tabController,
            children: [
              // Upcoming Tab
              upcoming.isEmpty
                  ? _EmptyState(
                      icon: Icons.calendar_today_outlined,
                      message: 'No upcoming appointments',
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        // Refresh logic here
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: upcoming.length,
                        itemBuilder: (context, index) {
                          final appointment = upcoming[index];
                          return AppointmentCard(
                            appointment: appointment,
                            onCancel: () {
                              _showCancelDialog(context, appointmentProvider, appointment.id);
                            },
                          );
                        },
                      ),
                    ),

              // Completed Tab
              completed.isEmpty
                  ? _EmptyState(
                      icon: Icons.check_circle_outline,
                      message: 'No completed appointments',
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        // Refresh logic here
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: completed.length,
                        itemBuilder: (context, index) {
                          final appointment = completed[index];
                          return AppointmentCard(
                            appointment: appointment,
                          );
                        },
                      ),
                    ),

              // All Tab
              all.isEmpty
                  ? _EmptyState(
                      icon: Icons.event_note,
                      message: 'No appointments yet',
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        // Refresh logic here
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: all.length,
                        itemBuilder: (context, index) {
                          final appointment = all[index];
                          return AppointmentCard(
                            appointment: appointment,
                            onCancel: appointment.status == 'upcoming'
                                ? () {
                                    _showCancelDialog(
                                        context, appointmentProvider, appointment.id);
                                  }
                                : null,
                          );
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }

  void _showCancelDialog(
      BuildContext context, AppointmentProvider provider, String appointmentId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Appointment'),
        content: const Text('Are you sure you want to cancel this appointment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              provider.cancelAppointment(appointmentId);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Appointment cancelled'),
                  backgroundColor: AppColors.warning,
                ),
              );
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: AppColors.error),
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

  const _EmptyState({
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

