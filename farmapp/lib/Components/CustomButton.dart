import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.name,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          onPressed: onPressed,
          child: Text(
            name,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
