import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/menu_provider.dart';
import '../../../../core/widgets/glass_panel.dart';
import 'menu_section.dart';
import '../../providers/overlay_provider.dart';


class MenuOverlay extends ConsumerWidget {
  const MenuOverlay({super.key});

  static const double menuWidth = 280;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(menuOpenProvider);

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
                      SizedBox(height: 20),

                      /// INTERACTION GUIDE
                      MenuSection(
                        title: "Panduan Interaksi",
                        icon: Icons.help_outline,
                        onTap: () {
                          ref.read(guideOverlayProvider.notifier).state = true;
                        },
                      ),

                      MenuSection(
                        title: "Mode Tampilan",
                        icon: Icons.view_in_ar,
                        onTap: () {
                          ref.read(viewModeOverlayProvider.notifier).state =
                              true;
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

                      SizedBox(height: 40),
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
