import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'doctors_list_screen.dart';

class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Anxiety',
        'icon': Icons.self_improvement_rounded,
        'color': Color(0xFF48CAE4),
      },
      {
        'title': 'Stress',
        'icon': Icons.spa_rounded,
        'color': Color(0xFFB5179E),
      },
      {
        'title': 'Depression',
        'icon': Icons.wb_sunny_rounded,
        'color': Color(0xFFF72585),
      },
      {
        'title': 'Insomnia',
        'icon': Icons.nights_stay_rounded,
        'color': Color(0xFF7209B7),
      },
      {
        'title': 'Relationships',
        'icon': Icons.favorite_rounded,
        'color': Color(0xFF4361EE),
      },
      {
        'title': 'Career',
        'icon': Icons.work_rounded,
        'color': Color(0xFF4CC9F0),
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // Calming Header
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            elevation: 0,
            backgroundColor: const Color(0xFF48CAE4),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF48CAE4), Color(0xFF4361EE)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      right: -30,
                      child: Icon(
                        Icons.spa_rounded,
                        size: 200,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Inner Peace',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Your mental well-being matters to us',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DoctorsListScreen(
                                    initialCategory: 'Psychiatrist',
                                  ),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.psychology_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Talk to a Specialist',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Mood Tracker Section
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -25),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(Theme.of(context).brightness == Brightness.dark
                              ? 0.2
                              : 0.05,
                        ),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'How are you feeling today?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _MoodIcon(emoji: '😊', label: 'Happy'),
                          _MoodIcon(emoji: '😐', label: 'Calm'),
                          _MoodIcon(emoji: '😔', label: 'Sad'),
                          _MoodIcon(emoji: '😫', label: 'Stressed'),
                          _MoodIcon(emoji: '😴', label: 'Tired'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Daily Tip Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.primary.withOpacity(0.1)
                      : const Color(0xFFF0F7FF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.primary.withOpacity(0.2)
                        : const Color(0xFFD0E6FF),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_rounded,
                      color: Color(0xFF4361EE),
                      size: 30,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Daily Mindfulness',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF4361EE),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Take 5 deep breaths and focus on the present moment.',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Categories Grid
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Browse Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final cat = categories[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(Theme.of(context).brightness == Brightness.dark
                              ? 0.1
                              : 0.02,
                        ),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: cat['color'].withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(cat['icon'], color: cat['color'], size: 24),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cat['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleMedium?.color,
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: categories.length),
            ),
          ),

          // Top Therapists Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended Therapists',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _TherapistCard(
                  name: 'Dr. Sarah Ahmed',
                  expertise: 'Clinical Psychologist',
                  rating: '4.9',
                  reviews: '120',
                  image:
                      'https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=200&h=200&fit=crop',
                ),
                _TherapistCard(
                  name: 'Prof. Faisal Khan',
                  expertise: 'Psychiatrist',
                  rating: '4.8',
                  reviews: '85',
                  image:
                      'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop',
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoodIcon extends StatelessWidget {
  final String emoji;
  final String label;

  const _MoodIcon({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _TherapistCard extends StatelessWidget {
  final String name;
  final String expertise;
  final String rating;
  final String reviews;
  final String image;

  const _TherapistCard({
    required this.name,
    required this.expertise,
    required this.rating,
    required this.reviews,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(Theme.of(context).brightness == Brightness.dark
                  ? 0.2
                  : 0.03,
            ),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkSurfaceMedium
                  : AppColors.surfaceMuted,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                Text(
                  expertise,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Theme.of(
                          context,
                        ).textTheme.bodySmall?.color?.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($reviews reviews)',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Book',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
