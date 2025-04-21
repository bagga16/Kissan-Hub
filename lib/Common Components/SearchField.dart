import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;

  SearchTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right, // Aligns text to the right
      textDirection: TextDirection.rtl, // Ensures RTL input
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Color(0xFF23D82C)), // Border color #23D82C
        ),
         enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Color(0xFF23D82C)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Color(0xFF23D82C), width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
