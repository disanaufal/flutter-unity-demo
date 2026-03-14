import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/glass_panel.dart';
import '../../providers/menu_provider.dart';

class TopGlassBar extends ConsumerWidget {
  const TopGlassBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: GlassPanel(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                  "AR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Anatomi\nTulang",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.2,
                  ),
                ),
              ],
            ),

            IconButton(
              icon: const Icon(Icons.tune, color: Colors.white, size: 40),
              onPressed: () {
                ref.read(menuOpenProvider.notifier).state = true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
