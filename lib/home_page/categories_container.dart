import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesContainer extends StatelessWidget {
  final Color color;
  final String title;
  final bool isActive;

  CategoriesContainer({
    required this.color,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: FittedBox(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(30),
            color: isActive ? Colors.green : Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: CircleAvatar(
                  backgroundColor: color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  title,
                  style: GoogleFonts.openSans(
                    color: isActive ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
