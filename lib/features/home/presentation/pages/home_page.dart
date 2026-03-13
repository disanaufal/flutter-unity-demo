import 'package:flutter/material.dart';
import 'package:flutter_unity_demo/features/home/presentation/widgets/bottom_buttons.dart';

import '../widgets/skeleton_view.dart';
import '../widgets/top_glass_bar.dart';
import '../widgets/info_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFF1E3A5F),
              Color(0xFF0B1622),
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: const Stack(
          children: [

            SkeletonView(),

            TopGlassBar(),

            InfoCard(),

            BottomButtons(),

          ],
        ),
      ),
    );
  }
}