import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('A B O U T  U S'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile for Person 1
            const ProfileCard(
              name: "Dio Dharmaesa",
              position: "Developer 1",
              imagePath: "assets/images/dio.jpg",
              description:
                  "Dio adalah Mahasiswa Universitas Mulawarman Fakultas Teknik Sejak 2022,Dio mempunyai Keahlian dalam bahasa Pemrograman Python.",
              position2: '2209106053',
            ),

            const SizedBox(height: 20),

            // Profile for Person 2
            const ProfileCard(
              name: "Zaky Syuhada",
              position: "Developer 2",
              position2: "2209106073",
              imagePath: "assets/images/jack.jpg",
              description:
                  "jack adalah Mahasiswa Universitas Mulawarman Fakultas Teknik Sejak 2022,Jack mempunyai Kegemaran dalam membuat desain dan kode yang menghasilkan visual yang menarik.",
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final String position2;
  final String imagePath;
  final String description;

  const ProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.position2,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              position,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey[600]),
            ),
            Text(
              position2,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
