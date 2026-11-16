import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/about_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = _themeMode == ThemeMode.dark;

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
      themeMode: _themeMode,

      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(
              isDarkMode: isDarkMode,
              onToggleTheme: _toggleTheme,
            ),
        '/profile': (context) => ProfilePage(
              isDarkMode: isDarkMode,
              onToggleTheme: _toggleTheme,
            ),
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
  }
}