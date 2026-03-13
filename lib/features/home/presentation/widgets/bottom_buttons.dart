import 'package:flutter/material.dart';
import '../../../../core/widgets/glass_panel.dart';


class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: GlassPanel(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Row(
          children: [

            /// 3D Button
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.view_in_ar, color: Colors.white,),
                label: const Text("Explorasi 3D", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6A2B),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            /// AR Button
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt, color: Colors.white,),
                label: const Text("Explorasi AR", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6A2B),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}