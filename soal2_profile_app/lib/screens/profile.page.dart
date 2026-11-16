import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleTheme;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile = const Profile(
    nama: 'Wisnu Azi',
    nim: '1124160235',
    prodi: 'Teknik Informatika',
    kelas: 'Shift',
    bio: 'Mahasiswa Teknik Informatika yang fokus pada pengembangan aplikasi mobile, web full stack, dan desain UI/UX.',
    email: 'wisnuazi@gmail.com',
    hp: '081234567890',
    github: 'wisnuazi000',
  );

  Future<void> _navigateToEditProfile() async {
    final result = await Navigator.pushNamed(
      context,
      '/edit-profile',
      arguments: _profile,
    );

    if (result != null && result is Profile) {
      setState(() {
        _profile = result;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data profil berhasil diperbarui')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            tooltip: widget.isDarkMode ? 'Mode Terang' : 'Mode Gelap',
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => widget.onToggleTheme(!widget.isDarkMode),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: colorScheme.primary),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              accountName: Text(
                _profile.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(_profile.email),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              selected: true,
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context);
                _navigateToEditProfile();
              },
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.brightness_6),
              title: const Text('Mode Gelap'),
              value: widget.isDarkMode,
              onChanged: widget.onToggleTheme,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Keluar', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 56,
                backgroundColor: colorScheme.primaryContainer,
                child: const CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _profile.nama,
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'NIM: ${_profile.nim} • Kelas: ${_profile.kelas}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                _profile.prodi,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _profile.bio,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Informasi Kontak',
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: Column(
                  children: [
                    InfoTile(
                      icon: Icons.email,
                      label: 'Email',
                      value: _profile.email,
                    ),
                    const Divider(height: 1),
                    InfoTile(
                      icon: Icons.phone,
                      label: 'Nomor HP',
                      value: _profile.hp,
                    ),
                    const Divider(height: 1),
                    InfoTile(
                      icon: Icons.code,
                      label: 'Akun GitHub',
                      value: _profile.github,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 72),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToEditProfile,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/about');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tentang Saya',
          ),
        ],
      ),
    );
  }
}