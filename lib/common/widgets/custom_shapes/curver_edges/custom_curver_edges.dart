import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height - 80;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height);

    path.quadraticBezierTo(0, height + 14, 15, height + 20);

    path.quadraticBezierTo(width / 2, height + 90, width - 15, height + 20);

    path.quadraticBezierTo(width, height + 14, width, height);

    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
