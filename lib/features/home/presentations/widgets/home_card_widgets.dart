import 'package:flutter/material.dart';

class HomeCardButton extends StatelessWidget {
  final String label;
  final String? imagePath; // optional image asset
  final IconData? iconData; // optional icon
  final VoidCallback onTap;

  const HomeCardButton({
    super.key,
    required this.label,
    this.imagePath,
    this.iconData,
    required this.onTap,
  }) : assert(
         imagePath != null || iconData != null,
         'Either imagePath or iconData must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          color: const Color(0xFFE7EEDC), // soft green tint
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Show image if provided
            if (imagePath != null) ...[
              Image.asset(imagePath!, width: 40, height: 40),
              const SizedBox(width: 16),
            ],

            // 🔹 Show icon if provided (and image is null)
            if (imagePath == null && iconData != null) ...[
              Icon(iconData, size: 40, color: const Color(0xFF2F4F3E)),
              const SizedBox(width: 16),
            ],

            // Text label
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2F4F3E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
