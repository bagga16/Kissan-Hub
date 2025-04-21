import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final TextStyle? textStyle;

  const CommonButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Color.fromRGBO(35, 216, 44, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: textStyle ?? const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
      ),
    );
  }
}
