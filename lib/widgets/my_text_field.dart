import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labalText;
  final bool obscureText;
  final String? Function(String?)? valid;
  final Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.labalText,
    required this.valid,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller, 
        obscureText: obscureText,
        validator: valid,
        onChanged: onChanged, 
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF9333EA)),
          ),
          hintText: hintText,
          label: Text(
            labalText,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
