import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/overlay_provider.dart';

class GuideBackButton extends ConsumerWidget {
  const GuideBackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () {

        //* hide overlay
        ref.read(guideOverlayProvider.notifier).state = false;

      },

      icon: const Icon(Icons.arrow_back),

      label: const Text("Kembali"),

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.2),
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
      ),
    );
  }
}