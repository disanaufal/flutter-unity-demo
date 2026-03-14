import 'dart:ui';
import 'package:flutter/material.dart';
import 'guide_back_button.dart';
import 'guide_item.dart';

class GuideOverlay extends StatelessWidget {
  const GuideOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            color: Colors.black.withValues(alpha: 0.35),

            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),

                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),

                  child: Container(
                    child: Container(
                      width: 340,
                      padding: const EdgeInsets.all(24),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),

                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withValues(alpha: 0.15),
                            Colors.white.withValues(alpha: 0.05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),

                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                      ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "Kendali Objek",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 20),

                          GuideItem(
                            icon: Icons.touch_app,
                            title: "Pilih",
                            desc:
                                "Ketuk pada bagian kerangka untuk memilihnya.",
                          ),

                          GuideItem(
                            icon: Icons.threed_rotation,
                            title: "Pindah & Putar",
                            desc:
                                "Seret satu jari untuk rotasi, dua jari untuk geser objek.",
                          ),

                          GuideItem(
                            icon: Icons.center_focus_strong,
                            title: "Focus",
                            desc:
                                "Ketuk dua kali pada bagian terpilih untuk memperbesarnya.",
                          ),

                          GuideItem(
                            icon: Icons.zoom_out_map,
                            title: "Perbesar & Perkecil",
                            desc:
                                "Cubit layar dengan dua jari untuk kontrol zoom model.",
                          ),

                          SizedBox(height: 20),

                          GuideBackButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
