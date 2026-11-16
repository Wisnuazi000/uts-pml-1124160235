import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Keahlian & Hobi',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          const Card(
            child: Column(
              children: [
                InfoTile(
                  icon: Icons.code,
                  label: 'Keahlian',
                  value: 'Full Stack, Web Development, UI & UX',
                ),
                Divider(height: 1),
                InfoTile(
                  icon: Icons.store,
                  label: 'Bisnis & Kewirausahaan',
                  value: 'KUDECANT (Decant Parfum Lokal & Timur Tengah)',
                ),
                Divider(height: 1),
                InfoTile(
                  icon: Icons.sports_esports,
                  label: 'Hobi',
                  value: 'eFootball',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Text(
            'Riwayat Pendidikan',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          const Card(
            child: Column(
              children: [
                InfoTile(
                  icon: Icons.school,
                  label: 'S1 Teknik Informatika',
                  value: 'Institut Teknologi & Bisnis Bina Sarana Global (Sekarang)',
                ),
                Divider(height: 1),
                InfoTile(
                  icon: Icons.account_balance,
                  label: 'SMA / SMK',
                  value: 'Pendidikan Menengah Atas / Kejuruan',
                ),
                Divider(height: 1),
                InfoTile(
                  icon: Icons.menu_book,
                  label: 'SMP',
                  value: 'Sekolah Menengah Pertama',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}