import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    super.key,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 36,
          child: TextField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            onChanged: onChanged,
            style: GoogleFonts.manrope(
              color: const Color(0xFFA2A2A2),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(prefixIcon, size: 18),
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}
