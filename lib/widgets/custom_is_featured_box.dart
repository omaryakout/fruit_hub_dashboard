import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../utils/app_images.dart';


class CustomFeaturedBox extends StatelessWidget {
  CustomFeaturedBox({super.key, required this.isFeatured, required this.passData});
  bool isFeatured;
  void Function(bool val) passData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          isFeatured = !isFeatured;
          passData(isFeatured);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 24,
          width: 24,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(
                  color: isFeatured ? Colors.transparent : const Color(0xffDDDFDF)),
            ),
            color: isFeatured ? const Color(0xff1B5E37) : Colors.white,
          ),
          child: isFeatured
              ? const Icon(Icons.check,color: Colors.white,)
              : const SizedBox(),
        ));
  }
}
