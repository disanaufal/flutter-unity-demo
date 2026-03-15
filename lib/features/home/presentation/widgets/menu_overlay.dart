import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/menu_provider.dart';
import '../../../../core/widgets/glass_panel.dart';
import 'menu_section.dart';
import '../../providers/overlay_provider.dart';
import '../../../../core/utills/tips.dart';

class MenuOverlay extends ConsumerWidget {
  const MenuOverlay({super.key});

  static const double menuWidth = 280;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(menuOpenProvider);
    final tip = TipsHelper.randomTip();

    return Stack(
      children: [
        /// DARK BACKGROUND
        if (isOpen)
          GestureDetector(
            onTap: () {
              ref.read(menuOpenProvider.notifier).state = false;
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: isOpen ? 0.4 : 0,
              child: Container(color: Colors.black),
            ),
          ),

        /// SLIDING MENU
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,

          right: isOpen ? 0 : -menuWidth,
          top: 0,
          bottom: 0,

          child: SizedBox(
            width: menuWidth,

            child: GlassPanel(
              radius: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),

              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      /// HEADER
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.orange.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.view_in_ar,
                              color: Colors.orangeAccent,
                            ),
                          ),

                          const SizedBox(width: 12),

                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "AR Anatomi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Menu",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      /// DIVIDER
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white.withValues(alpha: 0.25),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// MENU ITEMS
                      MenuSection(
                        title: "Panduan Interaksi",
                        icon: Icons.help_outline,
                        onTap: () {
                          ref.read(guideOverlayProvider.notifier).state = true;
                        },
                      ),

                      MenuSection(
                        title: "Mode Quiz",
                        icon: Icons.quiz,
                        onTap: () {
                          ref.read(quizOverlayProvider.notifier).state = true;
                        },
                      ),

                      MenuSection(
                        title: "Tampilan",
                        icon: Icons.palette,
                        onTap: () {
                          ref.read(themeOverlayProvider.notifier).state = true;
                        },
                      ),

                      MenuSection(
                        title: "Tentang",
                        icon: Icons.info_outline,
                        onTap: () {
                          ref.read(aboutOverlayProvider.notifier).state = true;
                        },
                      ),

                      const SizedBox(height: 50),

                      /// TIP CARD
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          "Tip: $tip",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
