import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // Emergency Header
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: const Color(0xFFD62828),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFD62828), Color(0xFF9B2226)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          l10n.emergencySos,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          l10n.helpJustAway,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // SOS Pulse Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Text(
                    l10n.needHelpImmediately,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.sosHoldMessage,
                    style: const TextStyle(color: AppColors.textMuted, fontSize: 14),
                  ),
                  const SizedBox(height: 50),
                  // Animated SOS Button
                  GestureDetector(
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Dispatching emergency services...'),
                          backgroundColor: Color(0xFFD90429),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Pulse rings
                        ...List.generate(3, (index) {
                          return _AnimatedPulseRing(
                            controller: _pulseController,
                            delay: index * 0.3,
                          );
                        }),
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFFEF233C), Color(0xFFD90429)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFFD90429,
                                ).withOpacity(0.4),
                                blurRadius: 30,
                                spreadRadius: 5,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.emergency_rounded,
                                color: Colors.white,
                                size: 60,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                l10n.sos,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 28,
                                  letterSpacing: 2,
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
            ),
          ),

          // Near You Info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: Color(0xFFD90429)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '${l10n.currentPosition}: Gulberg III, Lahore',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textMuted,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Ambulance Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Text(
                l10n.availableAmbulances,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const _AmbulanceCard(
                  title: 'Basic Life Support (BLS)',
                  desc: 'Oxygen, Pulse Ox, First Aid Kit',
                  price: 'Rs. 2,500',
                  icon: Icons.airport_shuttle_rounded,
                  color: Colors.blue,
                ),
                const _AmbulanceCard(
                  title: 'Advanced Cardiac (ACLS)',
                  desc: 'Ventilator, Monitor, Defibrillator',
                  price: 'Rs. 6,000',
                  icon: Icons.local_hospital_rounded,
                  color: Colors.orange,
                ),
                const _AmbulanceCard(
                  title: 'Air Ambulance',
                  desc: 'Critical long distance transport',
                  price: 'Rs. 75,000',
                  icon: Icons.airplanemode_active_rounded,
                  color: Colors.purple,
                ),
              ]),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

class _AnimatedPulseRing extends StatelessWidget {
  final AnimationController controller;
  final double delay;

  const _AnimatedPulseRing({required this.controller, required this.delay});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = (controller.value + delay) % 1.0;
        return Container(
          width: 180 + (100 * value),
          height: 180 + (100 * value),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFEF233C).withOpacity(1.0 - value),
              width: 2,
            ),
          ),
        );
      },
    );
  }
}

class _AmbulanceCard extends StatelessWidget {
  final String title;
  final String desc;
  final String price;
  final IconData icon;
  final Color color;

  const _AmbulanceCard({
    required this.title,
    required this.desc,
    required this.price,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: Theme.of(context).brightness == Brightness.dark
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFFD90429),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.surfaceMuted,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.call_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
