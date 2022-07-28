import 'package:flutter/material.dart';

class GradientBg extends StatelessWidget {
  const GradientBg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/gradient_bg.webp',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
