import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MenuSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 12),

          ...children,
        ],
      ),
    );
  }
}