import 'package:flutter/material.dart';

class AppStyleButton extends StatelessWidget {
  AppStyleButton({
    required this.text,
    required this.color,
    required this.onPressed,
    super.key,
  });
  String text;
  Color color;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: () => onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
