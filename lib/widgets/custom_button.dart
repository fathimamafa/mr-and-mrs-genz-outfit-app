import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  final Color backgroundColor;

  final Color textColor;

  final double height;

  final double borderRadius;

  final double fontSize;

  final IconData? icon;

  final bool isLoading;

  const CustomButton({
    super.key,

    required this.text,

    required this.onPressed,

    this.backgroundColor = const Color(0xffFF3D5A),

    this.textColor = Colors.white,

    this.height = 55,

    this.borderRadius = 15,

    this.fontSize = 18,

    this.icon,

    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,

          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),

        onPressed: isLoading ? null : onPressed,

        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,

                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  if (icon != null) ...[
                    Icon(icon, color: textColor),

                    const SizedBox(width: 10),
                  ],

                  Text(
                    text,

                    style: TextStyle(
                      color: textColor,

                      fontSize: fontSize,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
