import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';

class LabTestsScreen extends StatelessWidget {
  const LabTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<Map<String, dynamic>> categories = [
      {
        'icon': Icons.bloodtype_rounded,
        'label': l10n.bloodTest,
        'color': const Color(0xFFEF4444),
      },
      {
        'icon': Icons.favorite_rounded,
        'label': l10n.locale.languageCode == 'ur' ? 'دل' : 'Heart',
        'color': const Color(0xFFE11D48),
      },
      {
        'icon': Icons.monitor_heart_rounded,
        'label': l10n.vital,
        'color': const Color(0xFF2563EB),
      },
      {
        'icon': Icons.biotech_rounded,
        'label': l10n.hormone,
        'color': const Color(0xFF7C3AED),
      },
      {
        'icon': Icons.coronavirus_rounded,
        'label': l10n.covid,
        'color': const Color(0xFF059669),
      },
    ];

    final List<Map<String, String>> tests = [
      {
        'name': l10n.fullBodyCheckup,
        'price': l10n.locale.languageCode == 'ur' ? 'روپے 4,500' : 'Rs. 4,500',
        'time': l10n.twentyFourFortyEightHours,
        'icon': '🔬',
        'details': l10n.fullBodyCheckupDesc,
        'discount': l10n.tenPercentOff,
      },
      {
        'name': l10n.bloodGlucose,
        'price': l10n.locale.languageCode == 'ur' ? 'روپے 500' : 'Rs. 500',
        'time': l10n.twelveHours,
        'icon': '🩸',
        'details': l10n.bloodGlucoseDesc,
        'discount': '',
      },
      {
        'name': l10n.lipidProfile,
        'price': l10n.locale.languageCode == 'ur' ? 'روپے 1,200' : 'Rs. 1,200',
        'time': l10n.twentyFourHours,
        'icon': '🫀',
        'details': l10n.lipidProfileDesc,
        'discount': l10n.newTag,
      },
      {
        'name': l10n.thyroidProfile,
        'price': l10n.locale.languageCode == 'ur' ? 'روپے 1,500' : 'Rs. 1,500',
        'time': l10n.twentyFourHours,
        'icon': '🧪',
        'details': l10n.thyroidProfileDesc,
        'discount': '',
      },
      {
        'name': l10n.lft,
        'price': l10n.locale.languageCode == 'ur' ? 'روپے 1,800' : 'Rs. 1,800',
        'time': l10n.twentyFourHours,
        'icon': '🧬',
        'details': l10n.lftDesc,
        'discount': '',
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // Premium Header
          SliverAppBar(
            expandedHeight: 160,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
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
                          l10n.labTests,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.accurateResults,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Home Sample Collection Banner
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00B4D8), Color(0xFF0077B6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0077B6).withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.freeHomeCollection,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.freeHomeCollectionDesc,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              l10n.bookVisit,
                              style: const TextStyle(
                                color: Color(0xFF0077B6),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.home_work_rounded,
                      color: Colors.white,
                      size: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    l10n.browseByCategory,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      return Container(
                        width: 90,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? 0.2
                                          : 0.03,
                                    ),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                cat['icon'],
                                color: cat['color'],
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              cat['label'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.color,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                l10n.popularTests,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final test = tests[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          Theme.of(context).brightness == Brightness.dark
                              ? 0.2
                              : 0.03,
                        ),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            test['icon']!,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    test['name']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).textTheme.titleMedium?.color,
                                    ),
                                  ),
                                ),
                                if (test['discount']!.isNotEmpty)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.success.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      test['discount']!,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.success,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              test['details']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textMuted,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time_rounded,
                                  size: 14,
                                  color: AppColors.textMuted,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  test['time']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textMuted,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  test['price']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.add_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: tests.length),
            ),
          ),
        ],
      ),
    );
  }
}
