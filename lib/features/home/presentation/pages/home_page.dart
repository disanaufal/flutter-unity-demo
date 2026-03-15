import 'package:flutter/material.dart';
import 'package:flutter_unity_demo/features/home/presentation/widgets/bottom_buttons.dart';

import '../widgets/skeleton_view.dart';
import '../widgets/top_glass_bar.dart';
import '../widgets/info_card.dart';
import '../widgets/menu_overlay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/overlay_provider.dart';
import '../widgets/guide_overlay.dart';
import '../widgets/quiz_overlay.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [Color(0xFF1E3A5F), Color(0xFF0B1622)],
            stops: [0.0, 1.0],
          ),
        ),
        child: Stack(
          children: [
            SkeletonView(),
            const TopGlassBar(),
            const InfoCard(),
            const BottomButtons(),

            //* overlay menu
            MenuOverlay(),

            if (ref.watch(guideOverlayProvider)) const GuideOverlay(),
            if (ref.watch(quizOverlayProvider)) const QuizOverlay(),
          ],
        ),
      ),
    );
  }
}
