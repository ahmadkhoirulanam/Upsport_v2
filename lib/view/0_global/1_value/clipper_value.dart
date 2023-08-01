import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * 0.86)
      ..quadraticBezierTo(size.width * 0.05, size.height * 0.88,
          size.width * 0.2, size.height * 0.83)
      ..quadraticBezierTo(size.width * 0.32, size.height * 0.78,
          size.width * 0.43, size.height * 0.78)
      ..quadraticBezierTo(size.width * 0.54, size.height * 0.78,
          size.width * 0.64, size.height * 0.8)
      ..quadraticBezierTo(
          size.width * 0.85, size.height * 0.84, size.width, size.height * 0.7)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
