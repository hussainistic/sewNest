import 'package:flutter/material.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start at the top-left corner
    path.lineTo(0, size.height);

    // First curve: Slightly down, smooth transition
    var controlPoint1 = Offset(size.width / 3, size.height); // Starts slightly above the bottom-left
    var endPoint1 = Offset(size.width / 2, size.height - 40); // Low point, then starts rising
    path.quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);

    // Second curve: Rising towards the top-center
    var controlPoint2 = Offset(size.width * 3 / 4, size.height - 90);
    var endPoint2 = Offset(size.width, size.height - 70); // Slightly dips at the end
    path.quadraticBezierTo(controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);

    // Complete the top line
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}