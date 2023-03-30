import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget web;
  const ResponsiveLayout({super.key, required this.mobile, required this.web});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 900) {
          return mobile;
        } else {
          return web;
        }
      },
    );
  }
}
