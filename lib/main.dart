import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'providers/appointment_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/language_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/doctors_list_screen.dart';
import 'screens/appointments_screen.dart';
import 'screens/medical_records_screen.dart';
import 'screens/profile_screen.dart';
import 'utils/app_colors.dart';
import 'utils/app_localizations.dart';

import 'screens/splash_screen.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(const MedimeetApp());
}

class MedimeetApp extends StatelessWidget {
  const MedimeetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          return MaterialApp(
            title: 'MEDIMEET',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.theme,
            locale: languageProvider.locale,
            navigatorObservers: [routeObserver],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', 'US'), Locale('ur', 'PK')],
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isAuthenticated) {
          return const MainScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const DoctorsListScreen(),
    const AppointmentsScreen(),
    const MedicalRecordsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          indicatorColor: AppColors.primary.withValues(alpha: 0.08),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          height: 80,
          elevation: 0,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: AppColors.textSecondary),
              selectedIcon: Icon(Icons.home_rounded, color: AppColors.primary),
              label: AppLocalizations.of(context)?.home ?? 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline, color: AppColors.textSecondary),
              selectedIcon: Icon(
                Icons.people_rounded,
                color: AppColors.primary,
              ),
              label: AppLocalizations.of(context)?.doctors ?? 'Doctors',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.calendar_today_outlined,
                color: AppColors.textSecondary,
              ),
              selectedIcon: Icon(
                Icons.calendar_today_rounded,
                color: AppColors.primary,
              ),
              label: AppLocalizations.of(context)?.appointments ?? 'Schedule',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.medical_services_outlined,
                color: AppColors.textSecondary,
              ),
              selectedIcon: Icon(
                Icons.medical_services_rounded,
                color: AppColors.primary,
              ),
              label: AppLocalizations.of(context)?.records ?? 'Records',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline_rounded,
                color: AppColors.textSecondary,
              ),
              selectedIcon: Icon(
                Icons.person_rounded,
                color: AppColors.primary,
              ),
              label: AppLocalizations.of(context)?.profile ?? 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
