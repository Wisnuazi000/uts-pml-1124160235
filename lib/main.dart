import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Wisnu Azi',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,

      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  'Wisnu Azi',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),

                Text(
                  'NIM: 1124160235\nInformation Systems & Software Engineering',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                const Card(
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'wisnuazi@gmail.com',
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: '+62 812-3456-7890',
                      ),
                      InfoTile(
                        icon: Icons.class_,
                        label: 'Kelas',
                        value: 'Shift',
                      ),
                      InfoTile(
                        icon: Icons.code,
                        label: 'Akun GitHub',
                        value: 'wisnuazi000',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                const Card(
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.build,
                        label: 'Keahlian',
                        value: 'Full Stack, Web Development, UI & UX',
                      ),
                      InfoTile(
                        icon: Icons.store,
                        label: 'Bisnis',
                        value: 'KUDECANT (Decant Parfum)',
                      ),
                      InfoTile(
                        icon: Icons.sports_esports,
                        label: 'Hobi',
                        value: 'eFootball',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
