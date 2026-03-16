import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/overlay_provider.dart';

class GuideBackButton extends ConsumerWidget {
  const GuideBackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          ref.read(guideOverlayProvider.notifier).state = false;
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent.withValues(alpha: 0.15),
          foregroundColor: Colors.orangeAccent,
          elevation: 0,
          shape: const StadiumBorder(),
        ),

        child: const Text("Tutup"),
      ),
    );
  }
}
