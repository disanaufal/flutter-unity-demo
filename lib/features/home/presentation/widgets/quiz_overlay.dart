import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../providers/quiz_mode_provider.dart';
import '../../providers/overlay_provider.dart';

class QuizOverlay extends ConsumerWidget {
  const QuizOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final quizEnabled = ref.watch(quizModeProvider);

    return Positioned.fill(
      child: Container(
        color: Colors.black.withValues(alpha: 0.4),

        child: Center(
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(24),

            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(24),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Mode Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "Dalam mode ini aplikasi akan menanyakan nama bagian tulang. "
                  "Pilih bagian yang benar untuk melanjutkan.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text(
                      "Aktifkan Quiz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),

                    Switch(
                      value: quizEnabled,
                      onChanged: (value) {
                        ref.read(quizModeProvider.notifier).state = value;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ref.read(quizOverlayProvider.notifier).state = false;
                    },
                    child: const Text("Tutup"),
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