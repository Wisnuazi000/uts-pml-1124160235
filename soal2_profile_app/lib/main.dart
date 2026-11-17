import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/about_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';

final ValueNotifier<ThemeMode> appThemeNotifier = ValueNotifier(
  ThemeMode.light,
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: appThemeNotifier,
      builder: (context, currentThemeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Profil Wisnu Azi',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: currentThemeMode,
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/profile': (context) => const ProfilePage(),
            '/about': (context) => const AboutPage(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/edit-profile') {
              final profile = settings.arguments as Profile;
              return MaterialPageRoute(
                builder: (context) => EditProfilePage(profile: profile),
              );
            }
            return null;
          },
        );
      },
    );
  }
}