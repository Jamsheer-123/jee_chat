import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SinupButtons extends StatelessWidget {
  SinupButtons(
      {super.key,
      required this.text,
      required this.iconImage,
      required this.onTap});
  VoidCallback onTap;
  final String text;
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconImage,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
