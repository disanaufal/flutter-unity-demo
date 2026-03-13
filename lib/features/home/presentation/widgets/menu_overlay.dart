import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/menu_provider.dart';
import '../../../../core/widgets/glass_panel.dart';
import 'menu_section.dart';
import 'menu_item.dart';

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
              child: Container(
                color: Colors.black,
              ),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),

              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      SizedBox(height: 20),

                      /// INTERACTION GUIDE
                      MenuSection(
                        title: "Panduan Interaksi",
                        children: [

                          MenuItem(
                            icon: Icons.touch_app,
                            title: "Pilih",
                          ),

                          MenuItem(
                            icon: Icons.threed_rotation,
                            title: "Putar & Geser",
                          ),

                          MenuItem(
                            icon: Icons.zoom_in,
                            title: "Perbesar & Perkecil",
                          ),

                          MenuItem(
                            icon: Icons.center_focus_strong,
                            title: "Focus",
                          ),
                        ],
                      ),

                      /// VIEW MODE
                      MenuSection(
                        title: "Mode Tampilan",
                        children: [

                          MenuItem(
                            icon: Icons.view_in_ar,
                            title: "Mode AR",
                          ),

                          MenuItem(
                            icon: Icons.view_in_ar_outlined,
                            title: "Mode 3D",
                          ),

                          MenuItem(
                            icon: Icons.restart_alt,
                            title: "Reset Posisi Model",
                          ),
                        ],
                      ),

                      /// APPEARANCE
                      MenuSection(
                        title: "Tampilan",
                        children: [

                          MenuItem(
                            icon: Icons.palette,
                            title: "Ubah Tema",
                          ),
                        ],
                      ),

                      /// ABOUT
                      MenuSection(
                        title: "Tentang",
                        children: [

                          MenuItem(
                            icon: Icons.info_outline,
                            title: "Tentang Aplikasi",
                          ),

                          MenuItem(
                            icon: Icons.verified,
                            title: "Versi Aplikasi",
                          ),
                        ],
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