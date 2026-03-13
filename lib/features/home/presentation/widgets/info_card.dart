import 'package:flutter/material.dart';
import '../../../../core/widgets/glass_container.dart';
class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 180,
      left: 20,
      right: 20,
      child: GlassContainer(
        padding: const EdgeInsets.all(15),
        borderRadius: 28,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Paham", style: TextStyle(color: Colors.white, fontSize: 28)),


            Text(
              "Anatomi",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),


            Text(
              "Arahkan kamera Anda dan temukan dunia anatomi manusia secara interaktif.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                height: 1.5,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
