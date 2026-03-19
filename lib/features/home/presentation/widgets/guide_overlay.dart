import 'package:flutter/material.dart';
import 'package:flutter_unity_demo/core/widgets/glass_overlay.dart';

import 'guide_back_button.dart';
import 'guide_item.dart';

class GuideOverlay extends StatelessWidget {
  const GuideOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassOverlay(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.help_outline, color: Colors.orangeAccent),
              SizedBox(width: 10),
              Text(
                "Kendali Objek",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 20),

          GuideItem(
            icon: Icons.touch_app,
            title: "Pilih",
            desc: "Ketuk pada bagian kerangka untuk memilihnya.",
          ),

          GuideItem(
            icon: Icons.threed_rotation,
            title: "Pindah & Putar",
            desc: "Seret satu jari untuk rotasi, dua jari untuk geser objek.",
          ),

          GuideItem(
            icon: Icons.center_focus_strong,
            title: "Focus",
            desc: "Ketuk dua kali pada bagian terpilih untuk memperbesarnya.",
          ),

          GuideItem(
            icon: Icons.zoom_out_map,
            title: "Perbesar & Perkecil",
            desc: "Cubit layar dengan dua jari untuk kontrol zoom model.",
          ),

          SizedBox(height: 20),

          GuideBackButton(),
        ],
      ),
    );
  }
}
