import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
final String text;
final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF9333EA),
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
            ),
            onPressed: onPressed, child: Text(text, style: TextStyle(color: Colors.white),));
  }
}