import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/glass_overlay.dart';
import '../../providers/overlay_provider.dart';

class AboutOverlay extends ConsumerWidget {
  const AboutOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassOverlay(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.orangeAccent),
              SizedBox(width: 10),
              Text(
                "Tentang Aplikasi",
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// DESCRIPTION
          const Text(
            "Aplikasi ini membantu pengguna mempelajari anatomi tulang manusia "
            "melalui visualisasi 3D dan teknologi Augmented Reality (AR).",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          /// FEATURES
          const _SectionTitle(title: "Fitur"),
          const SizedBox(height: 8),

          const _BulletText(text: "Visualisasi 3D interaktif"),
          const _BulletText(text: "Mode AR (Augmented Reality)"),
          const _BulletText(text: "Mode Quiz"),
          const _BulletText(text: "Kontrol objek (putar, zoom, fokus)"),

          const SizedBox(height: 20),

          /// TECHNOLOGY
          const _SectionTitle(title: "Teknologi"),
          const SizedBox(height: 8),

          const _BulletText(text: "Flutter"),
          const _BulletText(text: "Unity"),
          const _BulletText(text: "Riverpod"),

          const SizedBox(height: 20),

          /// DEVELOPER
          const _SectionTitle(title: "Developer"),
          const SizedBox(height: 8),

          const Text(
            "Bonny",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 28),

          /// CLOSE BUTTON
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                ref.read(aboutOverlayProvider.notifier).state = false;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orangeAccent.withValues(alpha: 0.15),
                foregroundColor: Colors.orangeAccent,
                elevation: 0,
                shape: const StadiumBorder(),
              ),
              child: const Text("Tutup"),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.orangeAccent,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;

  const _BulletText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ",
              style: TextStyle(color: Colors.white70)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}