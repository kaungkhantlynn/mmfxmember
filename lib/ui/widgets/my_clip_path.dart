import 'package:flutter/material.dart';

import 'bottom_wave_clipper.dart';

class MyClipPath extends StatelessWidget {
  final Color backgroundColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: Container(
        color: backgroundColor,
        width: double.infinity,
        height: 450,
      ),
    );
  }
}
