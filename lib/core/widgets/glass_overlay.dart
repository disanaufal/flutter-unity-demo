import 'dart:ui';
import 'package:flutter/material.dart';

class GlassOverlay extends StatelessWidget {
  final Widget child;
  final double width;

  const GlassOverlay({
    super.key,
    required this.child,
    this.width = 340,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            color: Colors.black.withValues(alpha: 0.35),

            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),

                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),

                  child: Container(
                    width: width,
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

                    child: child,
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