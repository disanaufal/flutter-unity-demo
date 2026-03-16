import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';

import '../../providers/quiz_mode_provider.dart';
import '../../providers/overlay_provider.dart';

class QuizOverlay extends ConsumerWidget {
  const QuizOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Positioned.fill(
      child: Stack(
        children: [
          _OverlayBackground(),
          Center(child: _QuizCard()),
        ],
      ),
    );
  }
}

class _OverlayBackground extends StatelessWidget {
  const _OverlayBackground();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
      child: Container(color: Colors.black.withValues(alpha: 0.35)),
    );
  }
}

class _QuizCard extends ConsumerWidget {
  const _QuizCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizEnabled = ref.watch(quizModeProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: 340,
          padding: const EdgeInsets.all(26),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),

            gradient: LinearGradient(
              colors: [
                Colors.white.withValues(alpha: 0.15),
                Colors.white.withValues(alpha: 0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),

            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),

          child: _QuizContent(
            quizEnabled: quizEnabled,

            onToggleQuiz: (value) {
              ref.read(quizModeProvider.notifier).state = value;
            },

            onClose: () {
              ref.read(quizOverlayProvider.notifier).state = false;
            },
          ),
        ),
      ),
    );
  }
}

class _QuizContent extends StatelessWidget {
  final bool quizEnabled;
  final ValueChanged<bool> onToggleQuiz;
  final VoidCallback onClose;

  const _QuizContent({
    required this.quizEnabled,
    required this.onToggleQuiz,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.quiz_outlined, color: Colors.orangeAccent),
            SizedBox(width: 10),
            Text(
              "Mode Quiz",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        const Text(
          "Dalam mode ini aplikasi akan menanyakan nama bagian tulang. "
          "Pilih bagian yang benar untuk melanjutkan pembelajaran.",
          style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
        ),

        const SizedBox(height: 26),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Aktifkan Quiz",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            Switch(
              value: quizEnabled,
              onChanged: onToggleQuiz,
              activeThumbColor: Colors.orangeAccent,
              activeTrackColor: Colors.orangeAccent.withValues(alpha: 0.35),
              inactiveTrackColor: Colors.white24,
            ),
          ],
        ),

        const SizedBox(height: 28),

        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: onClose,

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent.withValues(alpha: 0.15),
              foregroundColor: Colors.orangeAccent,
              elevation: 0,
              shape: const StadiumBorder(),
            ),

            child: const Text("Tutup"),
          ),
        ),
      ],
    );
  }
}
