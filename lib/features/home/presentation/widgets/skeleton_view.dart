import 'package:flutter/material.dart';

class SkeletonView extends StatelessWidget {
  const SkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/skeleton.png",
        height: 420,
        fit: BoxFit.contain,
      ),
    );
  }
}