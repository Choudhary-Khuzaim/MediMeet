import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Expert Medical\nConsultations',
      subtitle: 'Connect with specialists instantly',
      description:
          'Access a network of verified doctors across all specialties from the comfort of your home.',
      image: 'assets/onboarding/doctor.png',
      color: AppColors.primary,
    ),
    OnboardingData(
      title: 'Express Pharmacy\nDelivery',
      subtitle: 'Genuine medicines delivered fast',
      description:
          'Order prescriptions and healthcare essentials with doorstep delivery in under 60 minutes.',
      image: 'assets/onboarding/pharmacy.png',
      color: AppColors.secondary,
    ),
    OnboardingData(
      title: 'Digital Health\nRecords',
      subtitle: 'Your history in one place',
      description:
          'Keep track of your lab results, prescriptions, and medical history with secure cloud storage.',
      image: 'assets/onboarding/records.png',
      color: AppColors.accent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _buildPage(index);
            },
          ),

          // Progress Indicator (Top)
          Positioned(
            top: 60,
            left: 24,
            right: 24,
            child: Row(
              children: [
                ...List.generate(
                  _pages.length,
                  (index) => Expanded(
                    child: AnimatedContainer(
                      duration: 300.ms,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: _currentPage >= index
                            ? _pages[_currentPage].color
                            : AppColors.border,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => _finishOnboarding(),
                  child: const Text(
                    'SKIP',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 500.ms).slideY(begin: -0.5),

          // Navigation Section
          Positioned(
            bottom: 50,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'STEP ${_currentPage + 1}',
                          style: TextStyle(
                            color: _pages[_currentPage].color,
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _currentPage == _pages.length - 1
                              ? 'Ready to start?'
                              : 'Swipe for more',
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                    .animate(key: ValueKey(_currentPage))
                    .fadeIn()
                    .slideX(begin: -0.2),
                GestureDetector(
                  onTap: () {
                    if (_currentPage == _pages.length - 1) {
                      _finishOnboarding();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOutQuint,
                      );
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutQuint,
                    width: _currentPage == _pages.length - 1 ? 170 : 70,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _pages[_currentPage].color,
                          _pages[_currentPage].color.withValues(alpha: 0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: _pages[_currentPage].color.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Center(
                      child: _currentPage == _pages.length - 1
                          ? const Text(
                              'GET STARTED',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                            ).animate().fadeIn(delay: 200.ms)
                          : const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                    ),
                  ),
                ).animate().scale(delay: 800.ms, curve: Curves.elasticOut),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    final data = _pages[index];
    return Stack(
      children: [
        // Image Section with Custom Clip
        ClipPath(
              clipper: OnboardingClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        data.color.withValues(alpha: 0.4),
                        Colors.black.withValues(alpha: 0.4),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            )
            .animate(key: ValueKey(index))
            .fadeIn(duration: 800.ms)
            .scale(begin: const Offset(1.1, 1.1)),

        // Text Content
        Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: 24,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                    width: 50,
                    height: 6,
                    decoration: BoxDecoration(
                      color: data.color,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  )
                  .animate(key: ValueKey('bar_$index'))
                  .slideX(begin: -1, duration: 600.ms),
              const SizedBox(height: 24),
              Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimary,
                      height: 1.1,
                      letterSpacing: -1.5,
                    ),
                  )
                  .animate(key: ValueKey('title_$index'))
                  .fadeIn(delay: 200.ms)
                  .slideY(begin: 0.2),
              const SizedBox(height: 12),
              Text(
                    data.subtitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: data.color,
                      letterSpacing: -0.5,
                    ),
                  )
                  .animate(key: ValueKey('subtitle_$index'))
                  .fadeIn(delay: 400.ms)
                  .slideY(begin: 0.2),
              const SizedBox(height: 20),
              Text(
                    data.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  .animate(key: ValueKey('desc_$index'))
                  .fadeIn(delay: 600.ms)
                  .slideY(begin: 0.2),
            ],
          ),
        ),
      ],
    );
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AuthWrapper(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final Color color;

  OnboardingData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.color,
  });
}

class OnboardingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
