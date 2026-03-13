import 'package:flutter/material.dart';

class SkeletonView extends StatelessWidget {
  const SkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Center(
        child: Image.asset(
          "assets/images/skeleton.png",
          height: MediaQuery.of(context).size.height * 0.90,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}