import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class FeaturedButton extends StatelessWidget {
  FeaturedButton({super.key, required this.onPressed , required this.text});
  final VoidCallback onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 112,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 242, 245, 243),
          foregroundColor: const Color.fromARGB(255, 34, 33, 33),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1))),
        ),
        child: FittedBox(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            text,
            style: AppTextStyle.bold19,
          ),
        )),
      ),
    );
  }
}
